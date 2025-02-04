#ifndef DATECLOCK_H
#define DATECLOCK_H

#include <QObject>
#include <QTimer>
#include <QDateTime>
#include <QTimeZone>

class DateClock : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString currentTime READ currentTime NOTIFY timeChanged)
    Q_PROPERTY(QString currentDate READ currentDate NOTIFY dateChanged)

public:
    explicit DateClock(QObject *parent = nullptr)
        : QObject(parent)
    {
        // 타이머를 사용하여 매초 현재 시간을 업데이트
        QTimer *timer = new QTimer(this);
        connect(timer, &QTimer::timeout, this, &DateClock::updateTime);
        timer->start(1000); // 1초마다 타이머 작동
    }

    QString currentTime() const
    {
        QDateTime utcDateTime = QDateTime::currentDateTimeUtc(); // UTC 현재 시간
        QTimeZone timeZone("Europe/Berlin");
        // 현재 시간을 QString 형식으로 반환
        return utcDateTime.toTimeZone(timeZone).toString("hh:mm:ss");
    }

    QString currentDate() const
    {
        QDateTime utcDateTime = QDateTime::currentDateTimeUtc(); // UTC 현재 시간
        QTimeZone timeZone("Europe/Berlin");
        // 현재 날짜를 mm/dd 형식으로 반환
        return utcDateTime.toTimeZone(timeZone).toString("dd.MM");
    }

signals:
    void timeChanged();
    void dateChanged();

public slots:
    void updateTime()
    {
        emit timeChanged(); // 시간이 변경되었음을 알림
        emit dateChanged();  // 날짜가 변경되었음을 알림 (날짜는 매일 변경되므로)
    }
};

#endif // DATECLOCK_H
