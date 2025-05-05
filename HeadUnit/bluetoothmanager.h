#ifndef BLUETOOTHMANAGER_H
#define BLUETOOTHMANAGER_H

#include <QObject>
#include <QDBusInterface>
#include <QDBusPendingCallWatcher>
#include <QDBusObjectPath>

class BluetoothManager : public QObject
{
    Q_OBJECT
public:
    explicit BluetoothManager(QObject *parent = nullptr);

    Q_INVOKABLE void startDiscovery();
    Q_INVOKABLE void stopDiscovery();
    Q_INVOKABLE void connectToDevice(const QString &deviceName);

signals:
    void deviceDiscovered(const QString &name, const QString &type);
    void discoveryFinished();
    void connectedToDevice(const QString &deviceName);
    void connectionFailed(const QString &reason);

private slots:
    void onConnectFinished(QDBusPendingCallWatcher *watcher);

private:
    QString getAdapterPath();
    QString getDevicePathByName(const QString &name);
    void fetchAllDevices();
    QString pendingDeviceName;
    void routeAudioToBluetooth();
};

#endif // BLUETOOTHMANAGER_H
