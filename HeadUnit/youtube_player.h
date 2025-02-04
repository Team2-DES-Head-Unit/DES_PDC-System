#ifndef YOUTUBE_PLAYER_H
#define YOUTUBE_PLAYER_H

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtNetwork>
#include <QJsonDocument>
#include <QJsonArray>
#include <QDebug>

class YoutubePlayer : public QObject{
    Q_OBJECT

public:
    explicit YoutubePlayer(QObject *parent = nullptr) : QObject(parent){
        fetchVideo();
    }

    Q_INVOKABLE void fetchVideo(){
        QNetworkAccessManager *manager = new QNetworkAccessManager(this);
        connect(manager, &QNetworkAccessManager::finished, this, &YoutubePlayer::VideoResult);

        QString api_url = "https://www.googleapis.com/youtube/v3/videos?part=snippet&chart=mostPopular&maxResults=10&regionCode=DE&key=AIzaSyCtwAD9fqgYlFNDceBrzv0wIwEw8dWl30w";
        QUrl url(api_url);
        manager->get(QNetworkRequest(url));
    }

private slots:
    void VideoResult(QNetworkReply *reply){
        if (reply->error() == QNetworkReply::NoError) {
            QByteArray response = reply->readAll();
            QJsonDocument doc = QJsonDocument::fromJson(response);
            QJsonArray items = doc["items"].toArray();

            emit videoFetched(items);
        } else {
            qDebug() << "Error:" << reply->errorString();
        }
        reply->deleteLater();
    }

signals:
    void videoFetched(QJsonArray items);
};

#endif // YOUTUBE_PLAYER_H
