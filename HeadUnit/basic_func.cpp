#include "basic_func.h"

#include <QTimerEvent>

TimeProvider::TimeProvider(QObject *parent) : QObject(parent){
    startTimer(1000);
}

QString TimeProvider::currentTime() const{
    QTimeZone timeZone("Europe/Berlin");
    QDateTime dateTime = QDateTime::currentDateTime().toTimeZone(timeZone);
    QLocale locale(QLocale::English, QLocale::UnitedStates);
    return locale.toString(dateTime, "hh:mm AP");
}

QString TimeProvider::currentDate() const{
    QTimeZone timeZone("Europe/Berlin");
    QDateTime dateTime = QDateTime::currentDateTime().toTimeZone(timeZone);
    QLocale locale(QLocale::English, QLocale::UnitedStates);
    return locale.toString(dateTime, "d MMM - yyyy");
}

void TimeProvider::timerEvent(QTimerEvent *){
    emit timeChanged();
    emit dateChanged();
}

/*//////////////////////////////////////////////////////////////////////////////////////*/
SpeedProvider::SpeedProvider(QObject *parent) : QObject(parent), m_currentSpeed(0){
    qsrand(QTime::currentTime().msec());
    startTimer(1000);
}

int SpeedProvider::currentSpeed() const{
    return m_currentSpeed;
}

void SpeedProvider::setCurrentSpeed(const int &speed){
    if (m_currentSpeed != speed){
        m_currentSpeed = speed;
        emit speedChanged();
    }
}

void SpeedProvider::timerEvent(QTimerEvent *){ // test value
    int randomSpeed = qrand() % 150;
//    setCurrentSpeed(QString::number(randomSpeed));
    setCurrentSpeed(randomSpeed);
}
