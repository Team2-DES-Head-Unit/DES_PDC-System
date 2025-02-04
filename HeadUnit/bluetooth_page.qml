import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12


Rectangle{
    id: bluetooth_window
    visible: true
    width: 413
    height: 445
    color: "transparent"
//    flags: Qt.FramelessWindowHint

    property bool isSearching: false
    property bool isStopped: true

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
        id: bluetooth_close_button
        x: 300
        y: 15
        width: 30 // 50
        height: 30 // 50
        fillMode: Image.PreserveAspectFit
//        source: "HU_Assets/Icons/tap_close_button.png"
        source: clickNotifier.clicked ? "HU_Assets/light/Components/Video/back_icon_l.png" : "HU_Assets/Components/Video/back_icon.png"
//        source: clickNotifier.clicked ? "HU_Assets/light/Icons/close_icon_l.png" : "HU_Assets/Icons/tap_close_button.png"

        MouseArea{
            anchors.fill: parent
            onClicked: {
                bluetooth_window.visible = false;
                service_selected.visible = false;
            }
        }
        Connections {
            target: service_selected
        }
    }

    Column {
        id: bluetooth_discovery
        spacing: 30
        Item {
            id: topmargin_Item
            width: parent.width
            height: 45
        }
        Row {
            id: bdbutton_row
            spacing: 20
            Item{
                id: leftmargin_Item
                width: 25
                height: 20
            }

            Text {
                id: bluetoothd_txt
                text: qsTr("Bluetooth Discovery")
                font.pixelSize: 20
//                color: "white"
                color: clickNotifier.clicked ? "#414141" : "white"
            }
            Button {
                id: bdbutton_on
                text: qsTr("On")
                width: 50
                height: 25
                onClicked: {
                    btManager.startDiscovery();
                    isSearching = true;
                    isStopped = false;
                    deviceModel.clear();
                }
            }
            Button {
                id: bdbutton_off
                text: qsTr("Off")
                width: 50
                height: 25
                onClicked: {
                    btManager.stopDiscovery();
                    isSearching = false;
                    isStopped = true;
                    deviceModel.clear();
                }
            }

        }

        Row {
            spacing: 20
            width: bd_list.width
            height: 30

            Item {
                id: name_gap
                width: 10
                height: 30
            }

            Text {
                text: "Name"
                font.bold: true
//                color: "white"
                color: clickNotifier.clicked ? "#414141" : "white"
            }

            Item {
                id: type_gap
                width: 150
                height: 30
            }

            Text {
                text: "Type"
                font.bold: true
//                color: "white"
                color: clickNotifier.clicked ? "#414141" : "white"
            }
        }

        Flickable {
            id: flick
            width: parent.width
            height: 250
            contentHeight: bd_list.contentHeight

            ListView {
                id: bd_list
                width: parent.width - 70
                height: 250
                anchors.left: parent.left
                anchors.leftMargin: 55
                model: ListModel {
                    id: deviceModel
                }

                delegate: Item {
                    width: bd_list.width
                    height: 30

                    Row {
                        spacing: 30
                        anchors.fill: parent

                        Text {
                            text: model.deviceName
                            font.bold: true
//                            color: "white"
                            color: clickNotifier.clicked ? "#414141" : "white"
                        }

                        Text {
                            text: "/"
//                            color: "white"
                            color: clickNotifier.clicked ? "#414141" : "white"
                        }

                        Text {
                            text: model.deviceType
                            font.bold: true
//                            color: "white"
                            color: clickNotifier.clicked ? "#414141" : "white"
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            btManager.connectToDevice(model.deviceName);
                        }
                    }
                }

                onContentYChanged: {
                    if (contentY < 0) {
                        contentY = 0;
                    }
                }

                Component.onCompleted: {
                    deviceModel.clear();
                }

                Text {
                    id: n_o
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin: 10
                    color: "white"
                    font.pixelSize: 25
                    font.bold: true
                    text: {
                        if (isStopped) {
                            return "Off";
                        } else if (isSearching && deviceModel.count === 0) {
                            return "None";
                        } else {
                            return "";
                        }
                    }
                    visible: deviceModel.count === 0
                }
            }

            ScrollBar.vertical: ScrollBar {
                policy: ScrollBar.AsNeeded
            }
        }

        Connections {
            target: btManager

            onDeviceDiscovered: function(deviceName, deviceType) {
                deviceModel.append({"deviceName": deviceName, "deviceType": deviceType});
            }

            onDiscoveryFinished: {
                console.log("Discovery finished.");
                isSearching = false;
            }
        }
    }

}
