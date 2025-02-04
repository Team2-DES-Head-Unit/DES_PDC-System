/****************************************************************************
** Meta object code from reading C++ file 'bluetoothmanager.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.12.8)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "bluetoothmanager.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'bluetoothmanager.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.12.8. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_BluetoothManager_t {
    QByteArrayData data[30];
    char stringdata0[473];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_BluetoothManager_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_BluetoothManager_t qt_meta_stringdata_BluetoothManager = {
    {
QT_MOC_LITERAL(0, 0, 16), // "BluetoothManager"
QT_MOC_LITERAL(1, 17, 16), // "deviceDiscovered"
QT_MOC_LITERAL(2, 34, 0), // ""
QT_MOC_LITERAL(3, 35, 10), // "deviceName"
QT_MOC_LITERAL(4, 46, 10), // "deviceType"
QT_MOC_LITERAL(5, 57, 17), // "discoveryFinished"
QT_MOC_LITERAL(6, 75, 17), // "connectedToDevice"
QT_MOC_LITERAL(7, 93, 14), // "connectionLost"
QT_MOC_LITERAL(8, 108, 16), // "connectionFailed"
QT_MOC_LITERAL(9, 125, 5), // "error"
QT_MOC_LITERAL(10, 131, 12), // "dataReceived"
QT_MOC_LITERAL(11, 144, 4), // "data"
QT_MOC_LITERAL(12, 149, 23), // "deviceDiscoveredHandler"
QT_MOC_LITERAL(13, 173, 20), // "QBluetoothDeviceInfo"
QT_MOC_LITERAL(14, 194, 10), // "deviceInfo"
QT_MOC_LITERAL(15, 205, 24), // "discoveryFinishedHandler"
QT_MOC_LITERAL(16, 230, 16), // "connectedHandler"
QT_MOC_LITERAL(17, 247, 19), // "disconnectedHandler"
QT_MOC_LITERAL(18, 267, 18), // "socketErrorHandler"
QT_MOC_LITERAL(19, 286, 29), // "QBluetoothSocket::SocketError"
QT_MOC_LITERAL(20, 316, 22), // "pairingFinishedHandler"
QT_MOC_LITERAL(21, 339, 17), // "QBluetoothAddress"
QT_MOC_LITERAL(22, 357, 7), // "address"
QT_MOC_LITERAL(23, 365, 30), // "QBluetoothLocalDevice::Pairing"
QT_MOC_LITERAL(24, 396, 7), // "pairing"
QT_MOC_LITERAL(25, 404, 14), // "readSocketData"
QT_MOC_LITERAL(26, 419, 14), // "startDiscovery"
QT_MOC_LITERAL(27, 434, 13), // "stopDiscovery"
QT_MOC_LITERAL(28, 448, 15), // "connectToDevice"
QT_MOC_LITERAL(29, 464, 8) // "sendData"

    },
    "BluetoothManager\0deviceDiscovered\0\0"
    "deviceName\0deviceType\0discoveryFinished\0"
    "connectedToDevice\0connectionLost\0"
    "connectionFailed\0error\0dataReceived\0"
    "data\0deviceDiscoveredHandler\0"
    "QBluetoothDeviceInfo\0deviceInfo\0"
    "discoveryFinishedHandler\0connectedHandler\0"
    "disconnectedHandler\0socketErrorHandler\0"
    "QBluetoothSocket::SocketError\0"
    "pairingFinishedHandler\0QBluetoothAddress\0"
    "address\0QBluetoothLocalDevice::Pairing\0"
    "pairing\0readSocketData\0startDiscovery\0"
    "stopDiscovery\0connectToDevice\0sendData"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_BluetoothManager[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      17,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       6,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    2,   99,    2, 0x06 /* Public */,
       5,    0,  104,    2, 0x06 /* Public */,
       6,    0,  105,    2, 0x06 /* Public */,
       7,    0,  106,    2, 0x06 /* Public */,
       8,    1,  107,    2, 0x06 /* Public */,
      10,    1,  110,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
      12,    1,  113,    2, 0x08 /* Private */,
      15,    0,  116,    2, 0x08 /* Private */,
      16,    0,  117,    2, 0x08 /* Private */,
      17,    0,  118,    2, 0x08 /* Private */,
      18,    1,  119,    2, 0x08 /* Private */,
      20,    2,  122,    2, 0x08 /* Private */,
      25,    0,  127,    2, 0x08 /* Private */,

 // methods: name, argc, parameters, tag, flags
      26,    0,  128,    2, 0x02 /* Public */,
      27,    0,  129,    2, 0x02 /* Public */,
      28,    1,  130,    2, 0x02 /* Public */,
      29,    1,  133,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::QString, QMetaType::QString,    3,    4,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,    9,
    QMetaType::Void, QMetaType::QByteArray,   11,

 // slots: parameters
    QMetaType::Void, 0x80000000 | 13,   14,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 19,    9,
    QMetaType::Void, 0x80000000 | 21, 0x80000000 | 23,   22,   24,
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,    3,
    QMetaType::Void, QMetaType::QByteArray,   11,

       0        // eod
};

void BluetoothManager::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<BluetoothManager *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->deviceDiscovered((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 1: _t->discoveryFinished(); break;
        case 2: _t->connectedToDevice(); break;
        case 3: _t->connectionLost(); break;
        case 4: _t->connectionFailed((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 5: _t->dataReceived((*reinterpret_cast< const QByteArray(*)>(_a[1]))); break;
        case 6: _t->deviceDiscoveredHandler((*reinterpret_cast< const QBluetoothDeviceInfo(*)>(_a[1]))); break;
        case 7: _t->discoveryFinishedHandler(); break;
        case 8: _t->connectedHandler(); break;
        case 9: _t->disconnectedHandler(); break;
        case 10: _t->socketErrorHandler((*reinterpret_cast< QBluetoothSocket::SocketError(*)>(_a[1]))); break;
        case 11: _t->pairingFinishedHandler((*reinterpret_cast< const QBluetoothAddress(*)>(_a[1])),(*reinterpret_cast< QBluetoothLocalDevice::Pairing(*)>(_a[2]))); break;
        case 12: _t->readSocketData(); break;
        case 13: _t->startDiscovery(); break;
        case 14: _t->stopDiscovery(); break;
        case 15: _t->connectToDevice((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 16: _t->sendData((*reinterpret_cast< const QByteArray(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 6:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QBluetoothDeviceInfo >(); break;
            }
            break;
        case 11:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QBluetoothAddress >(); break;
            case 1:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QBluetoothLocalDevice::Pairing >(); break;
            }
            break;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (BluetoothManager::*)(const QString & , const QString & );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&BluetoothManager::deviceDiscovered)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (BluetoothManager::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&BluetoothManager::discoveryFinished)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (BluetoothManager::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&BluetoothManager::connectedToDevice)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (BluetoothManager::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&BluetoothManager::connectionLost)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (BluetoothManager::*)(const QString & );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&BluetoothManager::connectionFailed)) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (BluetoothManager::*)(const QByteArray & );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&BluetoothManager::dataReceived)) {
                *result = 5;
                return;
            }
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject BluetoothManager::staticMetaObject = { {
    &QObject::staticMetaObject,
    qt_meta_stringdata_BluetoothManager.data,
    qt_meta_data_BluetoothManager,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *BluetoothManager::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *BluetoothManager::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_BluetoothManager.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int BluetoothManager::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 17)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 17;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 17)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 17;
    }
    return _id;
}

// SIGNAL 0
void BluetoothManager::deviceDiscovered(const QString & _t1, const QString & _t2)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)), const_cast<void*>(reinterpret_cast<const void*>(&_t2)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void BluetoothManager::discoveryFinished()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void BluetoothManager::connectedToDevice()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void BluetoothManager::connectionLost()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void BluetoothManager::connectionFailed(const QString & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 4, _a);
}

// SIGNAL 5
void BluetoothManager::dataReceived(const QByteArray & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 5, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
