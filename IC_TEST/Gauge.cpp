#include "Gauge.h"

#include <QPainter>
#include <QtMath>

// Base Gauge class implementation
Gauge::Gauge(QQuickItem *parent)
    : QQuickPaintedItem(parent),
      m_GaugeSize(350),
      m_StartAngle(-108),
      m_AlignAngle(306),
      m_LowestRange(0),
      m_HighestRange(100),
      m_ArcWidth(30),
      m_OuterColor(QColor("#00b890")),
      m_InnerColor(QColor("#a2f2d9")),
      m_TextColor(QColor("#ffffff")),
      m_BackgroundColor(Qt::transparent)
{
}

qreal Gauge::getGaugeSize() const { return m_GaugeSize; }
qreal Gauge::getStartAngle() const { return m_StartAngle; }
qreal Gauge::getAlignAngle() const { return m_AlignAngle; }
qreal Gauge::getLowestRange() const { return m_LowestRange; }
qreal Gauge::getHighestRange() const { return m_HighestRange; }
int Gauge::getArcWidth() const { return m_ArcWidth; }
QColor Gauge::getOuterColor() const { return m_OuterColor; }
QColor Gauge::getInnerColor() const { return m_InnerColor; }
QColor Gauge::getTextColor() const { return m_TextColor; }
QColor Gauge::getBackgroundColor() const { return m_BackgroundColor; }

void Gauge::setGaugeSize(qreal size) {
    if (m_GaugeSize == size) return;
    m_GaugeSize = size;
    emit gaugeSizeChanged();
}

void Gauge::setStartAngle(qreal startAngle) {
    if (m_StartAngle == startAngle) return;
    m_StartAngle = startAngle;
    emit startAngleChanged();
}

void Gauge::setAlignAngle(qreal angle) {
    if (m_AlignAngle == angle) return;
    m_AlignAngle = angle;
    emit alignAngleChanged();
}

void Gauge::setLowestRange(qreal lowestRange) {
    if (m_LowestRange == lowestRange) return;
    m_LowestRange = lowestRange;
    emit lowestRangeChanged();
}

void Gauge::setHighestRange(qreal highestRange) {
    if (m_HighestRange == highestRange) return;
    m_HighestRange = highestRange;
    emit highestRangeChanged();
}

void Gauge::setArcWidth(int arcWidth) {
    if (m_ArcWidth == arcWidth) return;
    m_ArcWidth = arcWidth;
    emit arcWidthChanged();
}

void Gauge::setOuterColor(const QColor &outerColor) {
    if (m_OuterColor == outerColor) return;
    m_OuterColor = outerColor;
    emit outerColorChanged();
}

void Gauge::setInnerColor(const QColor &innerColor) {
    if (m_InnerColor == innerColor) return;
    m_InnerColor = innerColor;
    emit innerColorChanged();
}

void Gauge::setTextColor(const QColor &textColor) {
    if (m_TextColor == textColor) return;
    m_TextColor = textColor;
    emit textColorChanged();
}

void Gauge::setBackgroundColor(const QColor &backgroundColor) {
    if (m_BackgroundColor == backgroundColor) return;
    m_BackgroundColor = backgroundColor;
    emit backgroundColorChanged();
}


// SpeedGauge class implementation
SpeedGauge::SpeedGauge(QQuickItem *parent)
    : Gauge(parent),
      m_Speed(50),
      m_Rpm(0)
{
}

qreal SpeedGauge::getSpeed() const {
    return m_Speed;
}

void SpeedGauge::setSpeed(qreal speed) {
    if (m_Speed == speed) return;
    m_Speed = speed;
    update();
    calculateRpm();
    emit speedChanged();
}

qreal SpeedGauge::getRpm() const
{
    return m_Rpm;  // RPM 값을 반환
}

void SpeedGauge::calculateRpm()
{
    // 바퀴의 둘레를 cm로 설정 (예시: 20.73 cm)
    qreal wheelCircumference = 20.73;  // cm 단위

    // RPM 계산: (속도(cm/s) * 60) / 바퀴의 둘레
    if (wheelCircumference > 0) {
        m_Rpm = (m_Speed * 60) / wheelCircumference;  // RPM 계산
    } else {
        m_Rpm = 0;  // 바퀴의 둘레가 0일 경우 RPM을 0으로 설정
    }

    emit rpmChanged();  // RPM 값이 변경되었음을 알림
}

void SpeedGauge::paint(QPainter *painter) {
    QRectF rect = this->boundingRect();
    painter->setRenderHint(QPainter::Antialiasing);
    QPen pen = painter->pen();
    pen.setCapStyle(Qt::FlatCap);

    double startAngle = m_StartAngle - 20;
    double spanAngle = -40 - m_AlignAngle;

    // Outer arc
    painter->save();
    pen.setWidth(m_ArcWidth);
    pen.setColor(m_InnerColor);
    painter->setPen(pen);
    painter->drawArc(rect.adjusted(m_ArcWidth, m_ArcWidth, -m_ArcWidth, -m_ArcWidth), startAngle * 16, spanAngle * 16);
    painter->restore();

    // Current speed arc
    painter->save();
    pen.setWidth(m_ArcWidth);
    pen.setColor(m_OuterColor);
    qreal valueToAngle = ((m_Speed - m_LowestRange) / (m_HighestRange - m_LowestRange)) * spanAngle;
    painter->setPen(pen);
    painter->drawArc(rect.adjusted(m_ArcWidth, m_ArcWidth, -m_ArcWidth, -m_ArcWidth), startAngle * 16, valueToAngle * 16);
    painter->restore();

    // Speed value text
    painter->save();
    QFont font("Helvetica", 52, QFont::Bold);
    painter->setFont(font);
    pen.setColor(m_TextColor);
    painter->setPen(pen);
    painter->drawText(rect.adjusted(m_GaugeSize / 30, m_GaugeSize / 2, -m_GaugeSize / 30, -m_GaugeSize / 5),
                      Qt::AlignCenter, QString::number(m_Speed, 'f', 1));
    painter->restore();
}


// RpmGauge class implementation
RpmGauge::RpmGauge(QQuickItem *parent)
    : Gauge(parent),
      m_Rpm(1000)
{
}

qreal RpmGauge::getRpm() const {
    return m_Rpm;
}

void RpmGauge::setRpm(qreal rpm) {
    if (m_Rpm == rpm) return;
    m_Rpm = rpm;
    update();
    emit rpmChanged();
}

void RpmGauge::paint(QPainter *painter) {
    QRectF rect = this->boundingRect();
    painter->setRenderHint(QPainter::Antialiasing);
    QPen pen = painter->pen();
    pen.setCapStyle(Qt::FlatCap);

    double startAngle = m_StartAngle - 20;
    double spanAngle = -40 - m_AlignAngle;

    // Outer arc
    painter->save();
    pen.setWidth(m_ArcWidth);
    pen.setColor(m_InnerColor);
    painter->setPen(pen);
    painter->drawArc(rect.adjusted(m_ArcWidth, m_ArcWidth, -m_ArcWidth, -m_ArcWidth), startAngle * 16, spanAngle * 16);
    painter->restore();

    // Current RPM arc
    painter->save();
    pen.setWidth(m_ArcWidth);
    pen.setColor(m_OuterColor);
    qreal valueToAngle = ((m_Rpm - m_LowestRange) / (m_HighestRange - m_LowestRange)) * spanAngle;
    painter->setPen(pen);
    painter->drawArc(rect.adjusted(m_ArcWidth, m_ArcWidth, -m_ArcWidth, -m_ArcWidth), startAngle * 16, valueToAngle * 16);
    painter->restore();

    // RPM value text
    painter->save();
    QFont font("Helvetica", 52, QFont::Bold);
    painter->setFont(font);
    pen.setColor(m_TextColor);
    painter->setPen(pen);
    painter->drawText(rect.adjusted(m_GaugeSize / 30, m_GaugeSize / 2, -m_GaugeSize / 30, -m_GaugeSize / 5),
                      Qt::AlignCenter, QString::number(m_Rpm, 'f', 1));
    painter->restore();
}
