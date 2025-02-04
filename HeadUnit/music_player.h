#ifndef MUSIC_PLAYER_H
#define MUSIC_PLAYER_H

#include <QDir>
#include <QStringList>
#include <QMediaPlayer>
#include <QUrl>
#include <QDebug>

class MusicPlayer : public QObject{
    Q_OBJECT
    Q_PROPERTY(QString musicProgress READ musicProgress NOTIFY musicProgressChanged)

public:
    explicit MusicPlayer(QObject *parent = nullptr) : QObject(parent), m_progress(0), currentIndex(3){ // initial song idx
        player = new QMediaPlayer(this);
        connect(player, &QMediaPlayer::positionChanged, this, &MusicPlayer::updateProgress);
    }

    QString musicProgress() const {return QString::number(m_progress);}

    QStringList getAlbums(const QString &dir_path, const QString filtering){
        QDir usbDir(dir_path);
        usbDir.setNameFilters(QStringList() << filtering);
//        qDebug() << usbDir.entryList();
        return usbDir.entryList();
    }

    QStringList getCovers() {
//        return getAlbums("/home/llj/catkin_ws/src/DES_Head-Unit/HeadUnit_Project/HeadUnit/Cover", "*.jpeg");
        // "/usr/bin/Cover"
        return getAlbums("/usr/bin/Cover", "*jpeg");
    }

    Q_INVOKABLE QStringList getMusics() {
//        return getAlbums("/media/llj/SanDisk/Music/", "*.mp3");
//        return getAlbums("/media/usb/Music/", "*.mp3");
        return getAlbums("/usr/bin/Music/", "*.mp3");
    }

    // songTitle : ex)"Hanumankind-Big_Dawgs.mp3"
    Q_INVOKABLE QString getCoverForSong(const QString &songTitle){
        QStringList coverList = getCovers();
//        qDebug() << coverlist.last();
        foreach (const QString &cover, coverList){
            if(cover.contains(songTitle.split("-")[0])){
//                qDebug() << "qrc:/Cover/" + cover;
                return "qrc:/Cover/" + cover;
            }
        } return QString();
    }

    Q_INVOKABLE QString getArtistForSong(const QString &songTitle){
//        qDebug() << songTitle.split("-")[0];
        return songTitle.split("-")[0];
    }

    Q_INVOKABLE QString getTitleForSong(const QString &songTitle){
        QString title = songTitle.split("-")[1];
        title = title.split(".")[0];
        title = title.replace("_", " ");
//        qDebug() << song;
        return title;
    }

    Q_INVOKABLE QString getPathForSong(const QString &songTitle){
        QStringList musicList = getMusics();
        foreach (const QString &music, musicList) {
            if(music == songTitle){
//                qDebug() << "/media/llj/SanDisk/Music/" + music;
//                return "/media/llj/SanDisk/Music/" + music;
//                return "/media/usb/Music/" + music;
                return "/usr/bin/Music/" + music;
            }
        } return QString();
    }

    // playlist except current played song
    Q_INVOKABLE QStringList getCurrentPlayList(const QString &songTitle){
        QStringList playList = getMusics();
        QStringList currentList;
        foreach (const QString &music, playList) {
            if(music != songTitle){
//                qDebug() << music;
                currentList.append(music);
            }
        } return currentList;
    }

    Q_INVOKABLE void setMusic(const QString &filePath){player->setMedia(QUrl::fromLocalFile(filePath));}

    Q_INVOKABLE void playMusic(const QString &filePath){
        player->play();
        emit musicPlayButton();
    }

    Q_INVOKABLE void pauseMusic() {
        player->pause();
        emit musicPauseButton();
    }

    Q_INVOKABLE void stopMusic() {player->stop();}

    Q_INVOKABLE bool playState() {return player->state() == QMediaPlayer::PlayingState;}

    Q_INVOKABLE int music_duration() {return player->duration();}
    Q_INVOKABLE int music_position() {return player->position();}

    Q_INVOKABLE void skipNext(){
        QStringList musicList = getMusics();
        if (musicList.isEmpty()){
            qDebug() << "Music list is empty";
            return;
        }

        qDebug() << "current song idx : " + QString::number(currentIndex);
        currentIndex = (currentIndex + 1) % musicList.size();

        QString nextSong = musicList[currentIndex];
        qDebug() << "next song idx : " + QString::number(currentIndex);
        qDebug() << "next song title : " + nextSong;

        setMusic(getPathForSong(nextSong));
        playMusic(getPathForSong(nextSong));

        QString coverPath = getCoverForSong(nextSong);
        QString title = getTitleForSong(nextSong);
        QString artist = getArtistForSong(nextSong);

        emit currentSongChanged(nextSong);
        emit nextSongInfo(title, artist, coverPath);
    }

    Q_INVOKABLE void skipPrevious(){
        QStringList musicList = getMusics();
        if (musicList.isEmpty()){
            qDebug() << "Music list is empty";
            return;
        }

        qDebug() << "current song idx : " + QString::number(currentIndex);
        currentIndex = (currentIndex - 1 + musicList.size()) % musicList.size();

        QString previousSong = musicList[currentIndex];
        qDebug() << "previous song idx : " + QString::number(currentIndex);
        qDebug() << "previous song title : " + previousSong;

        setMusic(getPathForSong(previousSong));
        playMusic(getPathForSong(previousSong));

        QString coverPath = getCoverForSong(previousSong);
        QString title = getTitleForSong(previousSong);
        QString artist = getArtistForSong(previousSong);

        emit currentSongChanged(previousSong);
        emit nextSongInfo(title, artist, coverPath);
    }

    Q_INVOKABLE void musicSelect(const QString &selectedMusic){
        setMusic(getPathForSong(selectedMusic));
        playMusic(getPathForSong(selectedMusic));

        QString coverPath = getCoverForSong(selectedMusic);
        QString title = getTitleForSong(selectedMusic);
        QString artist = getArtistForSong(selectedMusic);

        emit currentSongChanged(selectedMusic);
        emit nextSongInfo(title, artist, coverPath);
    }

signals:
    void musicProgressChanged();
    void currentSongChanged(const QString &songTitle);
    void nextSongInfo(const QString &title, const QString &artist, const QString &coverPath);
    void musicPauseButton();
    void musicPlayButton();

private slots:
    // occurs when positionChanged signal called - calculate music progress
    void updateProgress(){
        if(player->duration() >0){
            //m_progress = QString::number((position * 100) / player->duration());
            m_progress = (player->position() * 100) / player->duration();
            emit musicProgressChanged();
        }
    }

private:
    QMediaPlayer *player;
    int m_progress; // range : 0~100
    int currentIndex;
};

#endif // MUSIC_PLAYER_H
