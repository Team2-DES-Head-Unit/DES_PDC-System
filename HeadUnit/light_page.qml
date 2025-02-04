import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12


Rectangle{
    id: light_window
    visible: true
    width: 413
    height: 445
    color: "transparent"
//    flags: Qt.FramelessWindowHint

//    onActiveFocusItemChanged: {
//        if(!activeFocusItem){
//            visible = false;
//            service_selected.visible = false;
//        }
//    }

    Connections{
        target: service_selected
    }

    Image {
        id: light_close_button
        x: 300
        y: 15
        width: 30
        height: 30
        fillMode: Image.PreserveAspectFit
//        source: "HU_Assets/Icons/tap_close_button.png"
        source: clickNotifier.clicked ? "HU_Assets/light/Components/Video/back_icon_l.png" : "HU_Assets/Components/Video/back_icon.png"
//        source: clickNotifier.clicked ? "HU_Assets/light/Icons/close_icon_l.png" : "HU_Assets/Icons/tap_close_button.png"

        MouseArea{
            anchors.fill: parent
            onClicked: {
                light_window.visible = false;
                display_selected.visible = false;
            }
        }
        Connections {
            target: display_selected
        }
    }

    Rectangle {
        id: light_mode
        width: parent.width / 2 - 30
        height: 300
        anchors.top: parent.top
        anchors.topMargin: 80
        anchors.left: parent.left
        anchors.leftMargin: 27
        color: "#f6f6f6"
//        color: "transparent"

        Image {
            id: light_mode_img
            source: "HU_Assets/Background/light_mode.png"
            width: 176
            height: 256
            anchors.top: parent.top
        }

        Text {
            id: light_txt
            font.bold: true
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Light")
            color: "#7788F2"
//            color: "#1B03A4"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                clickNotifier.setTrue()
                check_mode.x = 102;
                client.send_mode_to_server(1);
            }
        }

    }
    Rectangle {
        id: dark_mode
        width: parent.width / 2 - 30
        height: 300
        anchors.top: parent.top
        anchors.topMargin: 80
        anchors.right: parent.right
        anchors.rightMargin: 17
//        color: "transparent"
        color: "#2b2b2b"

        Image {
            id: dark_mode_img
            source: "HU_Assets/Background/dark_mode.png"
            width: 176
            height: 256
            anchors.top: parent.top
        }

        Text {
            id: dark_txt
            font.bold: true
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Dark")
            color: "#87F1D0"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                clickNotifier.setFalse()
                check_mode.x = 295
                client.send_mode_to_server(0);
            }
        }
    }

    Image {
        id: check_mode
        x: 295
        y: 386
        fillMode: Image.PreserveAspectFit
        source: "HU_Assets/Background/check.png"
    }

}
