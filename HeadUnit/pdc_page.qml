import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Rectangle{
    id: pdc_window
    visible: true
    width: 618
    height: 480
    color: "transparent"

    Image {
        id: base_window
        fillMode: Image.PreserveAspectFit
        anchors.fill: parent
        source: clickNotifier.clicked ? "HU_Assets/light/Background/basic_window_l.png" : "HU_Assets/Background/basic_window.png"

        Image {
            id: car_png
            x: 139
            y: 86
            fillMode: Image.PreserveAspectFit
            source: "HU_Assets/Components/PDC/pdc_car.png"

            Image {
                id: alter_gauge
                x: 1
                y: 187
                fillMode: Image.PreserveAspectFit
                source: "HU_Assets/Components/PDC/alter_gray.png"
            }
        }

        Text {
            id: parking_assistant_txt
            x: 39
            y: 39
            text: qsTr("Parking Assistant")
            font.pixelSize: 30
            color: clickNotifier.clicked ? "#414141" : "#ffffff"
        }

        Text {
            id: distance_txt
            x: 320
            y: 216
            text: qsTr("Distance : ")
            font.pixelSize: 25
            color: clickNotifier.clicked ? "#414141" : "#ffffff"
        }

        Text {
            id: distance_value
            anchors{
                left: distance_txt.right
                top: distance_txt.top
                topMargin: 6
            }

            text: Receiver.distanceCm.toFixed(2) + " cm"
            font.pixelSize: 18
            color: clickNotifier.clicked ? "#414141" : "#ffffff"
        }

        Image {
            id: alter_red
            x: 189
            y: 352
            fillMode: Image.PreserveAspectFit
            source: "HU_Assets/Components/PDC/alter_red.png"
            visible: Receiver.distanceCm <= 15
        }

        Image {
            id: alter_yellow
            x: 167
            y: 368
            fillMode: Image.PreserveAspectFit
            source: "HU_Assets/Components/PDC/alter_yellow.png"
            visible: Receiver.distanceCm > 15 && Receiver.distanceCm <= 25
        }

        Image {
            id: alter_green
            x: 140
            y: 385
            fillMode: Image.PreserveAspectFit
            source: "HU_Assets/Components/PDC/alter_green.png"
            visible: Receiver.distanceCm > 25
        }


    }
}
