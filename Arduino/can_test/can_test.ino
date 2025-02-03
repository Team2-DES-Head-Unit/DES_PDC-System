#include <mcp_can.h>
#include <SPI.h>

// the cs pin of the version after v1.1 is default to D9
// v0.9b and v1.0 is default D10

const int SPI_CS_PIN = 9;

//set the variables of Speed sensor
#define ENCODER 3 //light detecting pin, connect D0 with 3
#define CIRCUMFERENCE 0.214 //enter in meter
#define PERIOD 0.1

// Ultrasonic Sensor
#define TRIG 8
#define ECHO 7 //9

volatile unsigned int counter = 0;
double rpm;

void count() {
    counter++;
}

/* Union for sending float data */
union DataUnion {
    float value;
    byte bytes[4];
} speedData, distanceData;

MCP_CAN CAN(SPI_CS_PIN); // Set CS pin

void setup() {
    Serial.begin(115200);
    
    while (CAN_OK != CAN.begin(MCP_ANY, CAN_500KBPS, MCP_16MHZ)) // init can bus : baudrate = 500k
    { 
        Serial.println("CAN BUS Shield init fail");
        Serial.println(" Init CAN BUS Shield again");
        delay(100);
    }
    
    Serial.println("CAN BUS Shield init ok!");
    CAN.setMode(MCP_NORMAL);

    // Speed Sensor setup
    pinMode(ENCODER, INPUT);
    digitalWrite(ENCODER, HIGH);
    
    attachInterrupt(digitalPinToInterrupt(ENCODER), count, RISING);
    
    // Ultrasonic Sensor setup
    pinMode(TRIG, OUTPUT);
    pinMode(ECHO, INPUT);
}

float getDistance() {
    digitalWrite(TRIG, HIGH);
    delayMicroseconds(15);
    digitalWrite(TRIG, LOW);
    
    float cycletime = pulseIn(ECHO, HIGH, 100000); // Timeout after 50ms
    if (cycletime == 0) {
        return -1;
    }
    
    return ((340.0 * cycletime) / 10000) / 2; // Distance in cm
}

void loop() {
    static uint32_t previousMillis;
    
    if (millis() - previousMillis >= 1000 * PERIOD) {
        // Calculate RPM and speed
        rpm = (counter / 20.0) * 60 / PERIOD;
        speedData.value = rpm * CIRCUMFERENCE * 100 / 60;
        
        counter = 0;
        previousMillis += 1000 * PERIOD;
        
        Serial.print("RPM: ");
        Serial.println(speedData.value);

        byte canMessage[8];

        for (int i=0; i<4; i++){
          canMessage[i] = speedData.bytes[i];
        }

        // // Send speed data over CAN
        // if (CAN.sendMsgBuf(0x00, 0, 4, speedData.bytes) == CAN_OK) {
        //     Serial.println("Succesfully sent!");
        // } else {
        //     Serial.println("Speed data send failed!");
        // }
        
        // Measure and send distance data
        distanceData.value = getDistance();
        
        Serial.print("Distance: ");
        Serial.print(distanceData.value);
        Serial.println(" cm");
        
        for (int i=0; i<4; i++){
          canMessage[4+i] = distanceData.bytes[i];
        }

        if (CAN.sendMsgBuf(0x00, 0, 8, canMessage) == CAN_OK) {
            Serial.println("Successfully sent!");
        } else {
            Serial.println("Data send failed!");
        }
    }
}

