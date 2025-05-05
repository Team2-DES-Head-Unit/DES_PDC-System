#include <QDBusConnection>
#include <QDBusInterface>
#include <QDBusReply>
#include <QDBusObjectPath>
#include <QDBusPendingCall>
#include <QDBusPendingCallWatcher>
#include <QMap>
#include <QVariant>
#include <QDebug>
#include <QProcess>
#include <QDBusMessage>
#include <QDBusArgument>
#include <QTimer>
#include <QProcess>

#include "bluetoothmanager.h"

using ManagedObjects = QMap<QDBusObjectPath, QMap<QString, QMap<QString, QVariant>>>;
Q_DECLARE_METATYPE(ManagedObjects)

BluetoothManager::BluetoothManager(QObject *parent) : QObject(parent) {}

QString BluetoothManager::getAdapterPath() {
    QDBusInterface manager("org.bluez", "/", "org.freedesktop.DBus.ObjectManager", QDBusConnection::systemBus());
    QDBusMessage reply = manager.call("GetManagedObjects");
    if (reply.type() != QDBusMessage::ReplyMessage) return "";
    QList<QVariant> args = reply.arguments();
    if (args.size() != 1) return "";
    const QDBusArgument &arg = args.first().value<QDBusArgument>();
    ManagedObjects objects;
    arg >> objects;
    for (auto it = objects.constBegin(); it != objects.constEnd(); ++it) {
        const auto &interfaces = it.value();
        if (interfaces.contains("org.bluez.Adapter1")) {
            return it.key().path();
        }
    }
    return "";
}

void BluetoothManager::startDiscovery() {
    QString adapterPath = getAdapterPath();
    if (adapterPath.isEmpty()) return;
    QDBusInterface adapter("org.bluez", adapterPath, "org.bluez.Adapter1", QDBusConnection::systemBus());
    QDBusReply<void> reply = adapter.call("StartDiscovery");
    if (!reply.isValid()) return;
    QTimer::singleShot(4000, this, &BluetoothManager::fetchAllDevices);
    fetchAllDevices();
}

void BluetoothManager::stopDiscovery() {
    QString adapterPath = getAdapterPath();
    if (adapterPath.isEmpty()) return;
    QDBusInterface adapter("org.bluez", adapterPath, "org.bluez.Adapter1", QDBusConnection::systemBus());
    QDBusReply<void> reply = adapter.call("StopDiscovery");
    if (reply.isValid()) emit discoveryFinished();
}

void BluetoothManager::fetchAllDevices() {
    QDBusInterface manager("org.bluez", "/", "org.freedesktop.DBus.ObjectManager", QDBusConnection::systemBus());
    QDBusMessage reply = manager.call("GetManagedObjects");
    QList<QVariant> args = reply.arguments();
    const QDBusArgument &arg = args.first().value<QDBusArgument>();
    ManagedObjects objects;
    arg >> objects;
    for (auto it = objects.constBegin(); it != objects.constEnd(); ++it) {
        const auto &interfaces = it.value();
        if (interfaces.contains("org.bluez.Device1")) {
            const auto &props = interfaces["org.bluez.Device1"];
            QString name = props.value("Name", "").toString();
            QString type = props.value("Icon", "Unknown").toString();
            emit deviceDiscovered(name, type);
        }
    }
    emit discoveryFinished();
}

QString BluetoothManager::getDevicePathByName(const QString &name) {
    QDBusInterface manager("org.bluez", "/", "org.freedesktop.DBus.ObjectManager", QDBusConnection::systemBus());
    QDBusMessage reply = manager.call("GetManagedObjects");
    QList<QVariant> args = reply.arguments();
    const QDBusArgument &arg = args.first().value<QDBusArgument>();
    ManagedObjects objects;
    arg >> objects;
    for (auto it = objects.constBegin(); it != objects.constEnd(); ++it) {
        const auto &interfaces = it.value();
        if (interfaces.contains("org.bluez.Device1")) {
            const auto &props = interfaces["org.bluez.Device1"];
            if (props.value("Name", "").toString() == name) {
                return it.key().path();
            }
        }
    }
    return "";
}

void BluetoothManager::connectToDevice(const QString &deviceName) {
    QString devicePath = getDevicePathByName(deviceName);
    if (devicePath.isEmpty()) {
        emit connectionFailed("장치 경로를 찾을 수 없습니다.");
        return;
    }
    pendingDeviceName = deviceName;

    QDBusInterface device("org.bluez", devicePath, "org.bluez.Device1", QDBusConnection::systemBus());
    QVariant iconVariant = device.property("Icon");
    QString icon = iconVariant.isValid() ? iconVariant.toString() : "";

    if (icon == "phone") {
        // Register Agent only for phones
        QDBusInterface agentManager("org.bluez", "/org/bluez", "org.bluez.AgentManager1", QDBusConnection::systemBus());
        QVariant agentPath = QVariant::fromValue(QDBusObjectPath("/my/agent"));
        QVariant capability = QVariant::fromValue(QStringLiteral("DisplayYesNo"));
        QDBusReply<void> agentReply = agentManager.call("RegisterAgent", agentPath, capability);

        if (!agentReply.isValid()) {
            qWarning() << "[Bluetooth][DBus] Agent 등록 실패:" << agentReply.error().message();
        }

        QDBusReply<void> pairReply = device.call("Pair");
        if (!pairReply.isValid()) {
            qWarning() << "[Bluetooth][DBus] Pair 실패:" << pairReply.error().message();
            emit connectionFailed(pairReply.error().message());
            return;
        }
    }

    QDBusPendingCall call = device.asyncCall("Connect");
    QDBusPendingCallWatcher *watcher = new QDBusPendingCallWatcher(call, this);
    connect(watcher, &QDBusPendingCallWatcher::finished, this, &BluetoothManager::onConnectFinished);
}

void BluetoothManager::routeAudioToBluetooth() {
    QProcess::execute("sh", {"-c", "CARD=$(pactl list cards short | grep bluez_card | awk '{print $1}'); if [ -n \"$CARD\" ]; then pactl set-card-profile $CARD a2dp_sink; fi"});
    QProcess::execute("sh", {"-c", "SINK=$(pactl list short sinks | grep bluez_sink | awk '{print $2}' | head -n1); if [ -n \"$SINK\" ]; then pactl set-default-sink $SINK; for i in $(pactl list short sink-inputs | awk '{print $1}'); do pactl move-sink-input $i $SINK; done; fi"});
}

void BluetoothManager::onConnectFinished(QDBusPendingCallWatcher *watcher) {
    QDBusPendingReply<> reply = *watcher;
    watcher->deleteLater();
    if (reply.isError()) {
        qWarning() << "[Bluetooth][DBus] Connect 실패:" << reply.error().message();
        emit connectionFailed(reply.error().message());
    } else {
        qDebug() << "[Bluetooth][DBus] 장치 연결됨";
        emit connectedToDevice(pendingDeviceName);
        routeAudioToBluetooth();
    }
}
