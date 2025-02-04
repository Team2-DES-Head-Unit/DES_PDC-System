#ifndef WEATHER_H
#define WEATHER_H

#include <QObject>
#include <QString>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QTimer>
#include <QDateTime>

class Weather : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString temperature READ temperature NOTIFY weatherUpdated)

public:
    explicit Weather(QObject *parent = nullptr)
        : QObject(parent), networkManager(new QNetworkAccessManager(this))
    {
        QTimer *timer = new QTimer(this);
        connect(timer, &QTimer::timeout, this, [this](){
            updateWeather("Wolfsburg");
        });
        timer->start(60000); // 1minute마다 타이머 작동
        updateWeather();
    }


    QString temperature() const
    {
        return m_temperature;
    }



signals:
    void weatherUpdated(); // 날씨 정보가 업데이트되었음을 알림

public slots:
    void updateWeather() {
            updateWeather("Wolfsburg"); // 기본값으로 서울의 날씨를 가져옴
        }
    void updateWeather(const QString &city) // 기본값으로 서울 설정
    {
        // OpenWeatherMap API를 사용하여 날씨 정보 가져오기
        QString apiKey = "aaa5e0893167222be40d82dd62ff141d"; // API 키를 여기에 입력하세요
        QString url = QString("https://api.openweathermap.org/data/2.5/weather?q=%1&appid=%2&units=metric")
                          .arg(city)
                          .arg(apiKey);

        QNetworkRequest request; // 빈 QNetworkRequest 객체 생성
        request.setUrl(QUrl(url)); // URL 설정
        QNetworkReply *reply = networkManager->get(request); // 올바르게 request 변수를 사용


        // 완료 시그널과 슬롯을 연결
        connect(reply, &QNetworkReply::finished, this, [this, reply]() {
            if (reply->error() == QNetworkReply::NoError) {
                // JSON 응답을 파싱
                QByteArray responseData = reply->readAll();
                QJsonDocument jsonDoc = QJsonDocument::fromJson(responseData);
                QJsonObject jsonObj = jsonDoc.object();

                // 온도와 날씨 상태 추출
                m_temperature = QString::number(jsonObj["main"].toObject()["temp"].toDouble()) + " °C";


                emit weatherUpdated(); // 날씨 정보가 변경되었음을 알림
            } else {
                // 에러 처리
                m_temperature = "Error";

                emit weatherUpdated(); // 날씨 정보가 변경되었음을 알림
            }
            reply->deleteLater(); // reply 객체 정리
        });
    }

private:
    QString m_temperature; // 온도를 저장하는 멤버 변수

    QNetworkAccessManager *networkManager; // 네트워크 요청 관리 객체
};


#endif // WEATHER_H
