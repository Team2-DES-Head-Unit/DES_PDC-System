/****************************************************************************
** Meta object code from reading C++ file 'music_player.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.12.8)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "music_player.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'music_player.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.12.8. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_MusicPlayer_t {
    QByteArrayData data[31];
    char stringdata0[391];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_MusicPlayer_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_MusicPlayer_t qt_meta_stringdata_MusicPlayer = {
    {
QT_MOC_LITERAL(0, 0, 11), // "MusicPlayer"
QT_MOC_LITERAL(1, 12, 20), // "musicProgressChanged"
QT_MOC_LITERAL(2, 33, 0), // ""
QT_MOC_LITERAL(3, 34, 18), // "currentSongChanged"
QT_MOC_LITERAL(4, 53, 9), // "songTitle"
QT_MOC_LITERAL(5, 63, 12), // "nextSongInfo"
QT_MOC_LITERAL(6, 76, 5), // "title"
QT_MOC_LITERAL(7, 82, 6), // "artist"
QT_MOC_LITERAL(8, 89, 9), // "coverPath"
QT_MOC_LITERAL(9, 99, 16), // "musicPauseButton"
QT_MOC_LITERAL(10, 116, 15), // "musicPlayButton"
QT_MOC_LITERAL(11, 132, 14), // "updateProgress"
QT_MOC_LITERAL(12, 147, 9), // "getMusics"
QT_MOC_LITERAL(13, 157, 15), // "getCoverForSong"
QT_MOC_LITERAL(14, 173, 16), // "getArtistForSong"
QT_MOC_LITERAL(15, 190, 15), // "getTitleForSong"
QT_MOC_LITERAL(16, 206, 14), // "getPathForSong"
QT_MOC_LITERAL(17, 221, 18), // "getCurrentPlayList"
QT_MOC_LITERAL(18, 240, 8), // "setMusic"
QT_MOC_LITERAL(19, 249, 8), // "filePath"
QT_MOC_LITERAL(20, 258, 9), // "playMusic"
QT_MOC_LITERAL(21, 268, 10), // "pauseMusic"
QT_MOC_LITERAL(22, 279, 9), // "stopMusic"
QT_MOC_LITERAL(23, 289, 9), // "playState"
QT_MOC_LITERAL(24, 299, 14), // "music_duration"
QT_MOC_LITERAL(25, 314, 14), // "music_position"
QT_MOC_LITERAL(26, 329, 8), // "skipNext"
QT_MOC_LITERAL(27, 338, 12), // "skipPrevious"
QT_MOC_LITERAL(28, 351, 11), // "musicSelect"
QT_MOC_LITERAL(29, 363, 13), // "selectedMusic"
QT_MOC_LITERAL(30, 377, 13) // "musicProgress"

    },
    "MusicPlayer\0musicProgressChanged\0\0"
    "currentSongChanged\0songTitle\0nextSongInfo\0"
    "title\0artist\0coverPath\0musicPauseButton\0"
    "musicPlayButton\0updateProgress\0getMusics\0"
    "getCoverForSong\0getArtistForSong\0"
    "getTitleForSong\0getPathForSong\0"
    "getCurrentPlayList\0setMusic\0filePath\0"
    "playMusic\0pauseMusic\0stopMusic\0playState\0"
    "music_duration\0music_position\0skipNext\0"
    "skipPrevious\0musicSelect\0selectedMusic\0"
    "musicProgress"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_MusicPlayer[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      22,   14, // methods
       1,  170, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       5,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,  124,    2, 0x06 /* Public */,
       3,    1,  125,    2, 0x06 /* Public */,
       5,    3,  128,    2, 0x06 /* Public */,
       9,    0,  135,    2, 0x06 /* Public */,
      10,    0,  136,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
      11,    0,  137,    2, 0x08 /* Private */,

 // methods: name, argc, parameters, tag, flags
      12,    0,  138,    2, 0x02 /* Public */,
      13,    1,  139,    2, 0x02 /* Public */,
      14,    1,  142,    2, 0x02 /* Public */,
      15,    1,  145,    2, 0x02 /* Public */,
      16,    1,  148,    2, 0x02 /* Public */,
      17,    1,  151,    2, 0x02 /* Public */,
      18,    1,  154,    2, 0x02 /* Public */,
      20,    1,  157,    2, 0x02 /* Public */,
      21,    0,  160,    2, 0x02 /* Public */,
      22,    0,  161,    2, 0x02 /* Public */,
      23,    0,  162,    2, 0x02 /* Public */,
      24,    0,  163,    2, 0x02 /* Public */,
      25,    0,  164,    2, 0x02 /* Public */,
      26,    0,  165,    2, 0x02 /* Public */,
      27,    0,  166,    2, 0x02 /* Public */,
      28,    1,  167,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,    4,
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::QString,    6,    7,    8,
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void,

 // methods: parameters
    QMetaType::QStringList,
    QMetaType::QString, QMetaType::QString,    4,
    QMetaType::QString, QMetaType::QString,    4,
    QMetaType::QString, QMetaType::QString,    4,
    QMetaType::QString, QMetaType::QString,    4,
    QMetaType::QStringList, QMetaType::QString,    4,
    QMetaType::Void, QMetaType::QString,   19,
    QMetaType::Void, QMetaType::QString,   19,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Bool,
    QMetaType::Int,
    QMetaType::Int,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,   29,

 // properties: name, type, flags
      30, QMetaType::QString, 0x00495001,

 // properties: notify_signal_id
       0,

       0        // eod
};

void MusicPlayer::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<MusicPlayer *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->musicProgressChanged(); break;
        case 1: _t->currentSongChanged((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 2: _t->nextSongInfo((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3]))); break;
        case 3: _t->musicPauseButton(); break;
        case 4: _t->musicPlayButton(); break;
        case 5: _t->updateProgress(); break;
        case 6: { QStringList _r = _t->getMusics();
            if (_a[0]) *reinterpret_cast< QStringList*>(_a[0]) = std::move(_r); }  break;
        case 7: { QString _r = _t->getCoverForSong((*reinterpret_cast< const QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 8: { QString _r = _t->getArtistForSong((*reinterpret_cast< const QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 9: { QString _r = _t->getTitleForSong((*reinterpret_cast< const QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 10: { QString _r = _t->getPathForSong((*reinterpret_cast< const QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 11: { QStringList _r = _t->getCurrentPlayList((*reinterpret_cast< const QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QStringList*>(_a[0]) = std::move(_r); }  break;
        case 12: _t->setMusic((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 13: _t->playMusic((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 14: _t->pauseMusic(); break;
        case 15: _t->stopMusic(); break;
        case 16: { bool _r = _t->playState();
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 17: { int _r = _t->music_duration();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        case 18: { int _r = _t->music_position();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        case 19: _t->skipNext(); break;
        case 20: _t->skipPrevious(); break;
        case 21: _t->musicSelect((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (MusicPlayer::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&MusicPlayer::musicProgressChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (MusicPlayer::*)(const QString & );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&MusicPlayer::currentSongChanged)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (MusicPlayer::*)(const QString & , const QString & , const QString & );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&MusicPlayer::nextSongInfo)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (MusicPlayer::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&MusicPlayer::musicPauseButton)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (MusicPlayer::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&MusicPlayer::musicPlayButton)) {
                *result = 4;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<MusicPlayer *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = _t->musicProgress(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject MusicPlayer::staticMetaObject = { {
    &QObject::staticMetaObject,
    qt_meta_stringdata_MusicPlayer.data,
    qt_meta_data_MusicPlayer,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *MusicPlayer::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *MusicPlayer::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_MusicPlayer.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int MusicPlayer::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 22)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 22;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 22)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 22;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 1;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void MusicPlayer::musicProgressChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void MusicPlayer::currentSongChanged(const QString & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void MusicPlayer::nextSongInfo(const QString & _t1, const QString & _t2, const QString & _t3)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)), const_cast<void*>(reinterpret_cast<const void*>(&_t2)), const_cast<void*>(reinterpret_cast<const void*>(&_t3)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void MusicPlayer::musicPauseButton()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void MusicPlayer::musicPlayButton()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
