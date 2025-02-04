#ifndef RECEIVER_H
#define RECEIVER_H

#include <QThread>
#include <sys/types.h>
#include <sys/socket.h>
#include <linux/can.h>
#include <linux/can/raw.h>
#include <net/if.h>
#include <sys/ioctl.h>
#include <unistd.h>
#include <cstdint>

union DataUnion {
    struct {
        float speed_kmh;
        float distance_cm;
    };
//    char bytes[4];
    uint8_t bytes[8]; // CAN message 8byte (speed + distance)
};

class Receiver: public QThread
{
    Q_OBJECT
    Q_PROPERTY(float speedKmh READ getSpeed NOTIFY speedReceived)
    Q_PROPERTY(float distanceCm READ getDistance NOTIFY distanceReceived)

private:
    int socketCAN;
    struct ifreq ifr = ifr;
    struct sockaddr_can addr;
//    DataUnion speed_data;
    DataUnion sensor_data;
    float speed_prev = 0;
    float distance_prev = 0;

public:
    static const int SUCCEDED = 0;
    static const int FAILED = -1;
    const float SMOOTHING_FACTOR = 0.4;

    Receiver(QObject *parent = nullptr);
    ~Receiver();
    Receiver(const Receiver& rcv);
    Receiver operator=(const Receiver& rcv);

    float getSpeed() const {
//        return speed_data.speed_kmh;
        return sensor_data.speed_kmh;
    }

    float getDistance() const {
        return sensor_data.distance_cm;
    }

    float EMA(float new_value, float prev_value);

    int initialize();
    void run();

signals:
    void speedReceived(float speedKmh);
    void distanceReceived(float distanceCm);
};

#endif // RECEIVER_H
