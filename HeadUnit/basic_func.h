#ifndef BASIC_FUNC_H
#define BASIC_FUNC_H

#include <QObject>
#include <QDateTime>
#include <QTimeZone>
#include <QLocale>

// time setting
class TimeProvider : public QObject{
    Q_OBJECT
    Q_PROPERTY(QString currentTime READ currentTime NOTIFY timeChanged)
    Q_PROPERTY(QString currentDate READ currentDate NOTIFY dateChanged)

public:
    explicit TimeProvider(QObject *parent = nullptr);

    QString currentTime() const;
    QString currentDate() const;

signals:
    void timeChanged();
    void dateChanged();

protected:
    void timerEvent(QTimerEvent *event) override;
};

/*//////////////////////////////////////////////////////////////////////////////////////*/
// get speed value
class SpeedProvider : public QObject{
    Q_OBJECT
    Q_PROPERTY(int currentSpeed READ currentSpeed NOTIFY speedChanged)

public:
    explicit SpeedProvider(QObject *parent = nullptr);

    int currentSpeed() const;
    void setCurrentSpeed(const int &speed);

signals:
    void speedChanged();

protected:
    void timerEvent(QTimerEvent *s_event) override;

private:
    int m_currentSpeed;
};


#endif // BASIC_FUNC_H
