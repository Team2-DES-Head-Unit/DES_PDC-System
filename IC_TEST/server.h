#ifndef SERVER_H
#define SERVER_H

#include <vsomeip/vsomeip.hpp>
#include <iostream>
#include <memory>
#include <vector>
#include <cstring>
#include <thread>
#include <QObject>

#define SAMPLE_SERVICE_ID 0x1234
#define SAMPLE_INSTANCE_ID_1 0x5678
#define SAMPLE_INSTANCE_ID_2 0x5679
#define SAMPLE_METHOD_ID 0x0421
#define SAMPLE_MODE_METHOD_ID 0x0422

extern std::shared_ptr<vsomeip::application> app;

struct ControlData {
    float throttle;
    float steering;
    uint8_t gear_P;
    uint8_t gear_D;
    uint8_t gear_R;
    uint8_t gear_N;
    uint8_t indicator_left;
    uint8_t indicator_right;
//    uint8_t battery_percentage;
};

class Server : public QObject {
    Q_OBJECT
    Q_PROPERTY(int gear READ gear NOTIFY gearChanged)
    Q_PROPERTY(bool indicatorLeft READ indicatorLeft NOTIFY indicatorLeftChanged)
    Q_PROPERTY(bool indicatorRight READ indicatorRight NOTIFY indicatorRightChanged)
//    Q_PROPERTY(bool battery READ battery NOTIFY batteryChanged)
    Q_PROPERTY(int mode READ mode WRITE setMode NOTIFY modeChanged)

public:
    explicit Server(QObject *parent = nullptr) : QObject(parent), m_gear(0), m_indicatorLeft(false), m_indicatorRight(false), m_mode(0) {}
    // m_gear(0) m_mode('D')
    int gear() const { return m_gear; }
    bool indicatorLeft() const { return m_indicatorLeft; }
    bool indicatorRight() const { return m_indicatorRight; }
//    int battery() const { return m_battery; }
    int mode() const { return m_mode; }

    void setMode(int mode){
        if (m_mode != mode){
            m_mode = mode;
            emit modeChanged();
        }
    }

    void updateGui(const ControlData &data) {
        m_gear = data.gear_P ? 1 : data.gear_D ? 2 : data.gear_R ? 3 : data.gear_N ? 4 : 0;
        m_indicatorLeft = data.indicator_left;
        m_indicatorRight = data.indicator_right;

//        m_battery = data.battery_percentage;

        emit gearChanged();
        emit indicatorLeftChanged();
        emit indicatorRightChanged();
//        emit batteryChanged();
    }

signals:
    void gearChanged();
    void indicatorLeftChanged();
    void indicatorRightChanged();
//    void batteryChanged();
    void modeChanged();

private:
    int m_gear;
    bool m_indicatorLeft;
    bool m_indicatorRight;
//    int m_battery;
    int m_mode;
};

extern Server server;

void start_server();

#endif // SERVER_H
