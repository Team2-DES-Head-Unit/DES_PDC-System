#ifndef WEATHER_PROVIDER_H
#define WEATHER_PROVIDER_H

#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>

class WeatherProvider : public QObject{
    Q_OBJECT
    Q_PROPERTY(QString cityName READ cityName WRITE setCityName NOTIFY cityNameChanged)
    Q_PROPERTY(QString temperature READ temperature NOTIFY temperatureChanged)
    Q_PROPERTY(QString description READ description NOTIFY descriptionChanged)


public:
    explicit WeatherProvider(QObject *parent = nullptr) : QObject(parent), manager(new QNetworkAccessManager(this)){
        connect(manager, &QNetworkAccessManager::finished, this, &WeatherProvider::onReplyFinished);
        // finished : signal / onReplyFinished : slot
    }
    void fetchWeather(){
        QString apikey = "aaa5e0893167222be40d82dd62ff141d";
        QString city = m_cityName;
        QString url = QString("http://api.openweathermap.org/data/2.5/weather?q=%1&appid=%2&units=metric&lang=de").arg(city, apikey);
        QUrl apiurl(url);

        QNetworkRequest request(apiurl);
        manager->get(request);
    }

    QString cityName() const { return m_cityName; }
    void setCityName(const QString &city){
        if (m_cityName != city){
            m_cityName = city;
            emit cityNameChanged();
            fetchWeather();
        }
    }

    QString temperature() const {return m_temperature;}
    QString description() const {return m_description;}

signals: // when the data changed, notice the UI
    void cityNameChanged();
    void temperatureChanged();
    void descriptionChanged();

private slots:
    void onReplyFinished(QNetworkReply *reply) {
        if (reply->error() == QNetworkReply::NoError) {
            QByteArray response = reply->readAll();

            QJsonDocument jsonDoc = QJsonDocument::fromJson(response);
            QJsonObject jsonObj = jsonDoc.object();

            QJsonObject main = jsonObj.value("main").toObject(); // main["temp"]
            m_temperature = QString::number(main.value("temp").toDouble()) + "°C";

            QJsonArray weatherArray = jsonObj.value("weather").toArray(); // weather[0]["description"]
            if (!weatherArray.isEmpty()) {
                m_description = weatherArray.first().toObject().value("description").toString();
            }

            emit temperatureChanged();
            emit descriptionChanged();
        }
        reply->deleteLater();
    }

private:
    QNetworkAccessManager *manager;
    QString m_cityName;
    QString m_temperature;
    QString m_description;
};

#endif // WEATHER_PROVIDER_H
