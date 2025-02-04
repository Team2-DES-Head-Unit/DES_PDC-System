import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
//import com.myapp.gauge 1.0

ApplicationWindow {
    id: bg_window
    visible: true
    width: 1280
//    visibility: Window.FullScreen
    height:400
//    color: "#28282c"
    color: Server.mode === 1 ? "#fcfcfc" : "#28282c"
    title: qsTr("Instrument Cluster")
//    flags: Qt.FramelessWindowHint

//    property int randomValue: Math.random() * 100 // 0부터 100까지의 랜덤 값

    property int angle: 0
    property int currentSpeed: 0
    property int targetSpeed: 0
    property int currentrpm: 0
    property int targetrpm: 0

    Image{
        id: bg_car
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.topMargin: 30
//        source: "/IC Assets/background_car.png"
        source: Server.mode === 1 ? "IC Assets/light/background_car_l.png" : "/IC Assets/background_car.png"
        fillMode: Image.PreserveAspectFit
    }
    Rectangle {
        id: speedGauge
        x: 32
        y: 0
        width: 400
        height: 400
        anchors.left: parent.left
        anchors.leftMargin: 32
        color: "transparent"
        Image {
            id: speed_dial
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
//            source: "/IC Assets/speedometer.png"
            source: Server.mode === 1 ? "/IC Assets/light/speedometer_l.png" : "/IC Assets/speedometer.png"
            fillMode: Image.PreserveAspectFit
        }
//        SpeedGauge {
//            id: s_gauge
//            objectName: "SpeedGauge"
//            anchors.horizontalCenter: speed_dial.horizontalCenter
//            anchors.verticalCenter: speed_dial.verticalCenter
//            width: gaugeSize
//            startAngle: startAngle
//            alignAngle: alignAngle
//            speed: randomValue //speed
//            arcWidth: arcWidth
//            outerColor: outerColor
//            innerColor: innerColor
//            textColor: textColor
//            backgroundColor: backgroundColor
//        }
        Canvas {
            id: speed_canvas
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: - 20
            anchors.verticalCenter: parent.verticalCenter
            width: 400
            height: 400

            property color gaugeColor: (Server.mode === 1) ? "#7788f2" : "#87f1d0"

            onPaint: {
                var ctx = getContext("2d");
                ctx.clearRect(0, 0, width, height);

                var centerX = width / 2;
                var centerY = height / 2;
                var startAngle = (116 * Math.PI) / 180;
                var endAngle = ((116 + (Receiver.speedKmh * 1.711)) * Math.PI) / 180;  // 끝 각도 (바늘 각도에 따라 변함)

                // 게이지 호 그리기
                ctx.beginPath();
                ctx.arc(centerX, centerY, 113, startAngle, endAngle, false);  // 원호 그리기
                ctx.lineWidth = 38;
//                ctx.strokeStyle = "#87F1D0";  // 게이지 색상
//                ctx.strokeStyle = Server.mode === 1 ? "#7788F2" : "#87F1D0"
                ctx.strokeStyle = speed_canvas.gaugeColor;
                ctx.stroke();
            }
            Connections{
                target: Server
                onModeChanged:{
                    speed_canvas.gaugeColor = (Server.mode === 1) ? "#7788f2" : "#87f1d0"
                    speed_canvas.update();
                }
            }
            Connections{
                target: Receiver
                onSpeedChanged:{
                    speed_canvas.update();
                }
            }

        }
        Image{
            id: speed_needle
            anchors.right: speed_dial.horizontalCenter
            anchors.bottom: speed_dial.verticalCenter
//            source: "/IC Assets/needle.png"
            source: Server.mode === 1 ? "/IC Assets/light/needle_l.png" : "/IC Assets/needle.png"
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.BottomRight
//            rotation: randomValue * 3.06 - 108 //(Receiver.speedKmh * 2.5 + 210)
            rotation: (Receiver.speedKmh * 1.7 - 108)

            Behavior on rotation{
                NumberAnimation{
                    duration: 50
                    easing.type: Easing.InOutQuad
                }
            }
             Connections{
                 target: Receiver
                 onSpeedChanged: speed_needle.angle = (Receiver.speedKmh * 1.7 - 108)
             }
        }
        Image{
            id: speed_inner
            anchors.centerIn: speed_dial
            source: "/IC Assets/inner_circle.png"
//            source: Server.mode === 1 ? "/IC Assets/light/inner_circle_l.png" : "/IC Assets/inner_circle.png"
            fillMode: Image.PreserveAspectFit
        }
        Text {
            id: speed_text
//            text: randomValue //Receiver.speedKmh.toFixed(0)
            text: Receiver.speedKmh.toFixed(0)
            anchors.centerIn: speed_dial
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            font.pixelSize: 30
//            color: "white"
//            color: Server.mode === 1 ? "#414141" : "#ffffff"
            color: "#ffffff"
            font.bold: true

             NumberAnimation{
                 id: speedAnimation
                 target: speed_text
                 property: "currentSpeed"
                 to: targetSpeed
                 duration: 800
                 easing.type: Easing.InOutQuad
             }
        }
         Connections{
                target: Receiver
                onSpeedChanged: {
                    speed_text.targetSpeed = Receiver.speedKmh.toFixed(0)
                    speedAnimation.start()
                }
         }
         Text {
             id: km_h
             text: qsTr("Km/h")
             anchors.top: speed_text.bottom
             anchors.topMargin: 20
             anchors.horizontalCenter:speed_dial.horizontalCenter
             font.pixelSize: 15
             color: "#939395"
         }
//         Text {
//             id: distance_text
//             text: qsTr("0 km")
//             anchors.horizontalCenter: speed_dial.horizontalCenter
//             anchors.bottom: parent.bottom
//             anchors.bottomMargin: 50
//             font.pixelSize: 25
////             color: "#87F1D0"
//             color: Server.mode === 1 ? "#7788F2" : "#87F1D0"
//         }
    }

    Rectangle {
        id: rpmGauge
        x: 848
        y: 0
        width: 400
        height: 400
        anchors.right: parent.right
        anchors.leftMargin: 32
        color: "transparent"
        Image{
            id: rpm_dial
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
//            source: "/IC Assets/speedometer.png"
            source: Server.mode === 1 ? "/IC Assets/light/speedometer_l.png" : "/IC Assets/speedometer.png"
            fillMode: Image.PreserveAspectFit
        }
//        RpmGauge {
//            id: r_gauge
//            objectName: "RpmGauge"
//            anchors.horizontalCenter: rpm_dial.horizontalCenter
//            anchors.verticalCenter: rpm_dial.verticalCenter
//            width: gaugeSize
//            startAngle: startAngle
//            alignAngle: alignAngle
//            rpm: randomValue //(speedGauge.rpm)
//            arcWidth: arcWidth
//            outerColor: outerColor
//            innerColor: innerColor
//            textColor: textColor
//            backgroundColor: backgroundColor

//        }
        Canvas {
            id: rpm_canvas
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 20
            anchors.verticalCenter: parent.verticalCenter
            width: 400
            height: 400

            property color gaugeColor: (Server.mode === 1) ? "#7788f2" : "#87f1d0"

            onPaint: {
                var ctx = getContext("2d");
                ctx.clearRect(0, 0, width, height);

                var centerX = width / 2;
                var centerY = height / 2;
                var startAngle = (116 * Math.PI) / 180;
                var endAngle = ((116 + ((Receiver.speedKmh * 2.895) * 0.514)) * Math.PI) / 180;  // 끝 각도 (바늘 각도에 따라 변함)

                // 게이지 호 그리기
                ctx.beginPath();
                ctx.arc(centerX, centerY, 113, startAngle, endAngle, false);  // 원호 그리기
                ctx.lineWidth = 38;
//                ctx.strokeStyle = "#87F1D0";  // 게이지 색상
//                ctx.strokeStyle = Server.mode === 1 ? "#7788F2" : "#87F1D0";
                ctx.strokeStyle = rpm_canvas.gaugeColor;
                ctx.stroke();
            }
            Connections{
                target: Server
                onModeChanged:{
                    rpm_canvas.gaugeColor = (Server.mode === 1) ? "#7788f2" : "#87f1d0"
                    rpm_canvas.update();
                }
            }
            Connections{
                target: Receiver
                onSpeedChanged:{
                    rpm_canvas.update();
                }
            }
        }

        Image{
            id: rpm_needle
            anchors.right: rpm_dial.horizontalCenter
            anchors.bottom: rpm_dial.verticalCenter
//            source: "/IC Assets/needle.png"
            source: Server.mode === 1 ? "/IC Assets/light/needle_l.png" : "/IC Assets/needle.png"
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.BottomRight
//            rotation: randomValue * 3.06 - 108 //(((Receiver.speedKmh) / (2 * 3.14 * 3.3)) * 60)
            rotation: ((((Receiver.speedKmh) *2.895) * 0.51) - 108)
            Behavior on rotation{
                NumberAnimation{
                    duration: 50
                    easing.type: Easing.InOutQuad
                }
            }
             Connections{
                 target: Receiver
                 onSpeedChanged: rpm_needle.angle = ((((Receiver.speedKmh) * 2.895) * 0.51) - 108)
             }
        }
        Image{
            id: rpm_inner
            anchors.centerIn: rpm_dial
            source: "/IC Assets/inner_circle.png"
//            source: Server.mode === 1 ? "/IC Assets/light/inner_circle_l.png" : "/IC Assets/inner_circle.png"
            fillMode: Image.PreserveAspectFit
        }
        Text {
            id: rpm_text
//            text: randomValue //(Receiver.speedKmh * 60) / (2 * 3.14 * 3.3)
//            text: (Receiver.speedKmh * 60) / (2 * 3.14 * 3.3)
            text: (Receiver.speedKmh * 2.895).toFixed(0)
            anchors.centerIn: rpm_dial
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            font.pixelSize: 30
//            color: "white"
//            color: Server.mode === 1 ? "#414141" : "#ffffff"
            color: "#ffffff"
            font.bold: true

             NumberAnimation{
                 id: rpmAnimation
                 target: rpm_text
                 property: "currentrpm"
                 to: targetrpm
                 duration: 800
                 easing.type: Easing.InOutQuad
             }
        }
         Connections{
                target: Receiver
                onValueChanged: {
                    rpm_text.targetrpm = (Receiver.speedKmh * 2.895).toFixed(0)
                    rpmAnimation.start()
                }
         }


        Text {
            id: x1000prm
            text: qsTr("X1000PRM")
            anchors.top: rpm_text.bottom
            anchors.topMargin: 20
            anchors.horizontalCenter:rpm_dial.horizontalCenter
            font.pixelSize: 15
            color: "#939395"
        }
        Text {
            id: gear_text_P
            text: qsTr("P")
            anchors.right: rpm_dial.horizontalCenter
            anchors.rightMargin: 28
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 50
            font.pixelSize: 30
//            color: Server.gear === 1 ? "#87F1D0" : "#939395"
//            color: {
//                if (Server.mode === 1){
//                    if(Server.gear === 1){
//                        return "#7788f2"
//                    }else{
//                        return "#939395"
//                    }
//                } else{
//                    if(Server.gear === 1){
//                        return "#87f1d0"
//                    }else{
//                        return "#939395"
//                    }
//                }
//            }

            color: (Server.mode === 1) ? (Server.gear === 1 ? "#7788F2" : "#939395") : (Server.gear === 1 ? "#87F1D0" : "#939395")

            font.bold: true
        }
        Text {
            id: gear_text_R
            text: qsTr("R")
            anchors.right: rpm_dial.horizontalCenter
            anchors.rightMargin: 2.75
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 50
            font.pixelSize: 30
//            color: Server.gear === 3 ? "#87F1D0" : "#939395"
            color: (Server.mode === 1) ? (Server.gear === 3 ? "#7788F2" : "#939395") : (Server.gear === 3 ? "#87F1D0" : "#939395")
            font.bold: true
        }
        Text {
            id: gear_text_N
            text: qsTr("N")
            anchors.left: rpm_dial.horizontalCenter
            anchors.leftMargin: 2.75
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 50
            font.pixelSize: 30
//            color: Server.gear === 4 ? "#87F1D0" : "#939395"
            color: (Server.mode === 1) ? (Server.gear === 4 ? "#7788F2" : "#939395") : (Server.gear === 4 ? "#87F1D0" : "#939395")
            font.bold: true
        }
        Text {
            id: gear_text_D
            text: qsTr("D")
            anchors.left: rpm_dial.horizontalCenter
            anchors.leftMargin: 28
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 50
            font.pixelSize: 30
//            color: Server.gear === 2 ? "#87F1D0" : "#939395"
            color: (Server.mode === 1) ? (Server.gear === 2 ? "#7788F2" : "#939395") : (Server.gear === 2 ? "#87F1D0" : "#939395")
            font.bold: true
        }
    }


    Image{
        id: topbar
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
//        source: "/IC Assets/top_bar.png"
        source: Server.mode === 1 ? "/IC Assets/light/top_bar_l.png" : "/IC Assets/top_bar.png"
        fillMode: Image.PreserveAspectFit
    }

    Image{
        id: topbar_menu
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
//        source: "/IC Assets/top_bar_menu.png"
        source: Server.mode === 1 ? "/IC Assets/light/top_bar_menu_l.png" : "/IC Assets/top_bar_menu.png"
        fillMode: Image.PreserveAspectFit
    }


    Image{
        id: left
        anchors.right: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        anchors.rightMargin: 104
        anchors.bottomMargin: 65
//        source: "/IC Assets/left_dark.png"
//        source: Server.indicatorLeft ? "/IC Assets/left_bright.png" : "/IC Assets/left_dark.png"
//        source:{
//            if(Server.mode === 1){
//                if(Server.indicatorLeft){
//                    return "/IC Assets/light/left_bright_l.png"
//                }else{
//                    return "/IC Assets/light/left_dark_l.png"
//                }
//            }
//            else{
//                if(Server.indicatorLeft){
//                    return "/IC Assets/left_bright.png"
//                }else{
//                    return "/IC Assets/left_dark.png"
//                }
//            }
//        }
        source: (Server.mode === 1) ? (Server.indicatorLeft ? "/IC Assets/light/left_bright_l.png" : "/IC Assets/light/left_dark_l.png") : (Server.indicatorLeft ? "/IC Assets/left_bright.png" : "/IC Assets/left_dark.png")
        fillMode: Image.PreserveAspectFit
    }

    Image{
        id: right
        anchors.left: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        anchors.leftMargin: 96
        anchors.bottomMargin:65
//        source: "/IC Assets/right_dark.png"
//        source: Server.indicatorRight ? "/IC Assets/right_bright.png" : "/IC Assets/right_dark.png"
        source: (Server.mode === 1) ? (Server.indicatorRight ? "/IC Assets/light/right_bright_l.png" : "/IC Assets/light/right_dark_l.png") : (Server.indicatorRight ? "/IC Assets/right_bright.png" : "/IC Assets/right_dark.png")
        fillMode: Image.PreserveAspectFit
    }



//    Image{
//        id: battery
//        anchors.right: parent.right
//        anchors.rightMargin: 20
//        anchors.top: parent.top
//        width: 20
//        height: 20
//        source: "/IC Assets/battery.png"
//        fillMode: Image.PreserveAspectFit
//    }

//    Text {
//        id: battery_text
//        text: qsTr("90%") /*battery_value + "%"*/
//        anchors.right: battery.left
//        anchors.rightMargin: 5
//        anchors.top: parent.top
//        anchors.topMargin: 2
//        font.pixelSize: 11
////        color: "white"
//        color: Server.mode === 1 ? "#414141" : "#ffffff"
//    }

    Image{
        id: bottombar
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
//        source: "/IC Assets/bottom_bar.png"
        source: Server.mode === 1 ? "/IC Assets/light/bottom_bar_l.png" : "/IC Assets/bottom_bar.png"
        fillMode: Image.PreserveAspectFit
    }

    Text {
        id: time_text
        text: Clock.currentTime
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 55
        font.pixelSize: 25
//        color: "white"
        color: Server.mode === 1 ? "#414141" : "#ffffff"
        font.bold: true
    }
     Connections{
         target: Clock
         onTimeChanged: time_text.text = Clock.currentTime
     }

    Text {
        id: day_text
        text: Date.currentDate
        anchors.right: time_text.left
        anchors.rightMargin: 90
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 45
        font.pixelSize: 20
        color: "#939395"
    }
    Connections{
        target: Date
        onDateChanged: day_text.text = Date.currentDate
    }

    Text {
        id: temperature_text
        text: Weather.temperature
        anchors.left: time_text.right
        anchors.leftMargin: 90
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 45
        font.pixelSize: 20
        color: "#939395"
    }
    Connections{
        target: Weather
        onWeatherUpdated: temperature_text.text = Weather.temperature
    }


}
