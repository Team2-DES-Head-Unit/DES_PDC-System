#ifndef BLUETOOTHMANAGER_H
#define BLUETOOTHMANAGER_H

#include <QObject>
#include <QBluetoothDeviceDiscoveryAgent>
#include <QBluetoothLocalDevice>
#include <QBluetoothSocket>
#include <QBluetoothDeviceInfo>
#include <QList>

class BluetoothManager : public QObject
{
    Q_OBJECT
public:
    explicit BluetoothManager(QObject *parent = nullptr);
    ~BluetoothManager();

    Q_INVOKABLE void startDiscovery();
    Q_INVOKABLE void stopDiscovery();

    Q_INVOKABLE void connectToDevice(const QString &deviceName);

    Q_INVOKABLE void sendData(const QByteArray &data);

signals:
    void deviceDiscovered(const QString &deviceName, const QString &deviceType);
    void discoveryFinished();
    void connectedToDevice();
    void connectionLost();
    void connectionFailed(const QString &error);
    void dataReceived(const QByteArray &data);

private slots:
    void deviceDiscoveredHandler(const QBluetoothDeviceInfo &deviceInfo);
    void discoveryFinishedHandler();
    void connectedHandler();
    void disconnectedHandler();
    void socketErrorHandler(QBluetoothSocket::SocketError error);
    void pairingFinishedHandler(const QBluetoothAddress &address, QBluetoothLocalDevice::Pairing pairing);
    void readSocketData();

private:
    QString getDeviceType(const QBluetoothDeviceInfo &deviceInfo) const;

    QBluetoothDeviceDiscoveryAgent *discoveryAgent;
    QBluetoothLocalDevice *localDevice;
    QBluetoothSocket *socket;

    QList<QBluetoothDeviceInfo> discoveredDevices;
};

#endif // BLUETOOTHMANAGER_H
