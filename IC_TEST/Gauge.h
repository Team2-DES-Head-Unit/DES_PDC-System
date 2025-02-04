#ifndef GAUGE_H
#define GAUGE_H

#include <QObject>
#include <QQuickPaintedItem>
#include <QColor>
#include <QPainter>

// Base class Gauge to share common properties
class Gauge : public QQuickPaintedItem
{
    Q_OBJECT

    Q_PROPERTY(qreal gaugeSize READ getGaugeSize WRITE setGaugeSize NOTIFY gaugeSizeChanged)
    Q_PROPERTY(qreal startAngle READ getStartAngle WRITE setStartAngle NOTIFY startAngleChanged)
    Q_PROPERTY(qreal alignAngle READ getAlignAngle WRITE setAlignAngle NOTIFY alignAngleChanged)
    Q_PROPERTY(qreal lowestRange READ getLowestRange WRITE setLowestRange NOTIFY lowestRangeChanged)
    Q_PROPERTY(qreal highestRange READ getHighestRange WRITE setHighestRange NOTIFY highestRangeChanged)
    Q_PROPERTY(int arcWidth READ getArcWidth WRITE setArcWidth NOTIFY arcWidthChanged)
    Q_PROPERTY(QColor outerColor READ getOuterColor WRITE setOuterColor NOTIFY outerColorChanged)
    Q_PROPERTY(QColor innerColor READ getInnerColor WRITE setInnerColor NOTIFY innerColorChanged)
    Q_PROPERTY(QColor textColor READ getTextColor WRITE setTextColor NOTIFY textColorChanged)
    Q_PROPERTY(QColor backgroundColor READ getBackgroundColor WRITE setBackgroundColor NOTIFY backgroundColorChanged)

public:
    explicit Gauge(QQuickItem *parent = nullptr);
    virtual void paint(QPainter *painter) override = 0;  // Pure virtual to be implemented by subclasses

    // Getters
    qreal getGaugeSize() const;
    qreal getStartAngle() const;
    qreal getAlignAngle() const;
    qreal getLowestRange() const;
    qreal getHighestRange() const;
    int getArcWidth() const;
    QColor getOuterColor() const;
    QColor getInnerColor() const;
    QColor getTextColor() const;
    QColor getBackgroundColor() const;

    // Setters
    void setGaugeSize(qreal size);
    void setStartAngle(qreal startAngle);
    void setAlignAngle(qreal angle);
    void setLowestRange(qreal lowestRange);
    void setHighestRange(qreal highestRange);
    void setArcWidth(int arcWidth);
    void setOuterColor(const QColor &outerColor);
    void setInnerColor(const QColor &innerColor);
    void setTextColor(const QColor &textColor);
    void setBackgroundColor(const QColor &backgroundColor);

signals:
    void gaugeSizeChanged();
    void startAngleChanged();
    void alignAngleChanged();
    void lowestRangeChanged();
    void highestRangeChanged();
    void arcWidthChanged();
    void outerColorChanged();
    void innerColorChanged();
    void textColorChanged();
    void backgroundColorChanged();

protected:
    qreal m_GaugeSize;
    qreal m_StartAngle;
    qreal m_AlignAngle;
    qreal m_LowestRange;
    qreal m_HighestRange;
    int m_ArcWidth;
    QColor m_OuterColor;
    QColor m_InnerColor;
    QColor m_TextColor;
    QColor m_BackgroundColor;
};

// SpeedGauge class derived from Gauge
class SpeedGauge : public Gauge
{
    Q_OBJECT

    Q_PROPERTY(qreal speed READ getSpeed WRITE setSpeed NOTIFY speedChanged)
    Q_PROPERTY(qreal rpm READ getRpm NOTIFY rpmChanged) // RPM 프로퍼티 추가

public:
    explicit SpeedGauge(QQuickItem *parent = nullptr);
    void paint(QPainter *painter) override;

    qreal getSpeed() const;
    void setSpeed(qreal speed);

    // RPM 계산
    qreal getRpm() const;

signals:
    void speedChanged();
    void rpmChanged();  // RPM 값이 변경될 때 시그널

private:
    qreal m_Speed;
    qreal m_Rpm;  // 내부에서 RPM을 저장

    // speed 값을 이용해 RPM을 계산하는 함수
    void calculateRpm();
};

// RpmGauge class derived from Gauge
class RpmGauge : public Gauge
{
    Q_OBJECT

    Q_PROPERTY(qreal rpm READ getRpm WRITE setRpm NOTIFY rpmChanged)

public:
    explicit RpmGauge(QQuickItem *parent = nullptr);
    void paint(QPainter *painter) override;

    qreal getRpm() const;
    void setRpm(qreal rpm);

signals:
    void rpmChanged();

private:
    qreal m_Rpm;
};

#endif // GAUGE_H
