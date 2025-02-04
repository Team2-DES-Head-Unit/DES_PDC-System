import QtQuick 2.12
import QtQuick.Window 2.12


Rectangle{
    id: setting_window
    visible: true
    //    x: 565
    //    y: 195
    width: 618
    height: 480
    color: "transparent"
//    flags: Qt.FramelessWindowHint

//    onActiveFocusItemChanged: {
//        if(!activeFocusItem){
//            visible = false;
//            icon_line.x = 138;
//        }
//    }

    Image {
        id: base_window
        fillMode: Image.PreserveAspectFit
        anchors.fill: parent
//        source: "HU_Assets/Background/basic_window.png"
        source: clickNotifier.clicked ? "HU_Assets/light/Background/basic_window_l.png" : "HU_Assets/Background/basic_window.png"

        Image {
            id: menu_bar
            x: 15
            y: 10
//            source: "HU_Assets/Background/menu_bar.png"
            source: clickNotifier.clicked ? "HU_Assets/light/Background/menu_bar_l.png" : "HU_Assets/Background/menu_bar.png"
            fillMode: Image.PreserveAspectFit

            Rectangle {
                id: setting
                x: 27
                y: 22
                width: 101
                height: 30
                color: "transparent"

                Image {
                    id: setting_icon
                    width: 28
//                    source: "HU_Assets/Icons/settings.png"
                    source: clickNotifier.clicked ? "HU_Assets/light/Icons/settings_l.png" : "HU_Assets/Icons/settings.png"
                    fillMode: Image.PreserveAspectFit
                    anchors{
                        verticalCenter: setting.verticalCenter
                        left: setting.left
                    }
                }

                Text {
                    id: setting_text
                    x: 47
                    width: 61
                    height: 22
                    text: qsTr("Setting")
                    font.pixelSize: 20
//                    color: "#ffffff"
                    color: clickNotifier.clicked ? "#414141" : "#ffffff"
                    anchors{
                        verticalCenter: setting.verticalCenter
                        right: setting.right
                    }
                }
            }

                        Image {
                id: usrinfo_selected
                anchors.horizontalCenter: user_info.horizontalCenter
                anchors.verticalCenter: user_info.verticalCenter
                anchors.verticalCenterOffset: 5.5
                anchors.horizontalCenterOffset: 5.5
                fillMode: Image.PreserveAspectFit
                visible: false
//                source: "/HU_Assets/Background/select_menu.png"
                source: clickNotifier.clicked ? "HU_Assets/light/Background/select_menu_l.png" : "HU_Assets/Background/select_menu.png"
            }

            Rectangle {
                id: user_info
                x: 42
                y: 126
                width: 101
                height: 25
                color: "transparent"

                Image {
                    id: user_info_icon
                    x: 0
                    y: 0
//                    source: "HU_Assets/Icons/user_phone.png"
                    source: clickNotifier.clicked ? "HU_Assets/light/Icons/user_phone_l.png" : "HU_Assets/Icons/user_phone.png"
                    fillMode: Image.PreserveAspectFit
                    anchors{
                        verticalCenter: user_info.verticalCenter
                        left: user_info.left
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        usrinfo_selected.visible = true;

                        if (infoQmlLoader.item){
                            infoQmlLoader.item.visible = !infoQmlLoader.item.visible;
                            infoQmlLoader.item.x = setting_window.x - 193;
                            infoQmlLoader.item.y = setting_window.y - 26;
                        }
                    }
                }

                Text {
                    id: user_info_text
                    text: qsTr("User Info")
                    font.pixelSize: 17
//                    color: "#ffffff"
                    color: clickNotifier.clicked ? "#414141" : "#ffffff"
                    anchors{
                        verticalCenter: user_info.verticalCenter
                        right: user_info.right
                    }
                }
            }

            Image {
                id: display_selected
                anchors.horizontalCenter: display.horizontalCenter
                anchors.verticalCenter: display.verticalCenter
                anchors.verticalCenterOffset: 5.5
                anchors.horizontalCenterOffset: 6.5
                fillMode: Image.PreserveAspectFit
                visible: false
//                source: "/HU_Assets/Background/select_menu.png"
                source: clickNotifier.clicked ? "HU_Assets/light/Background/select_menu_l.png" : "HU_Assets/Background/select_menu.png"
            }

            Rectangle {
                id: display
                x: 42
                y: 186
                width: 95
                height: 25
                color: "#00000000"
                Image {
                    id: display_icon
                    x: 0
                    y: 0
                    width: 24
                    height: 22
                    anchors.verticalCenter: display.verticalCenter
                    anchors.left: display.left
//                    source: "HU_Assets/Icons/display.png"
                    source: clickNotifier.clicked ? "HU_Assets/light/Icons/display_l.png" : "HU_Assets/Icons/display.png"
                    fillMode: Image.PreserveAspectFit
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
//                        lightQmlLoader.active = true;

//                        lightQmlLoader.item.visible = true;
//                        lightQmlLoader.item.x = setting_window.x + 200;
//                        lightQmlLoader.item.y = setting_window.y + 14;

//                        lightQmlLoader.visible = true;
//                        lightQmlLoader.x = setting_window.x + 200;
//                        lightQmlLoader.y = setting_window.y + 14;
                        display_selected.visible = true;

                        if (lightQmlLoader.item){
                            lightQmlLoader.item.visible = !lightQmlLoader.item.visible;
                            lightQmlLoader.item.x = setting_window.x - 193;
                            lightQmlLoader.item.y = setting_window.y - 26;
                        }
                    }
                }

                Text {
                    id: display_text
//                    color: "#ffffff"
                    color: clickNotifier.clicked ? "#414141" : "#ffffff"
                    text: qsTr("Display")
                    anchors.right: display.right
                    anchors.verticalCenter: display.verticalCenter
                    font.pixelSize: 17
                }
            }

            Image {
                id: service_selected
                anchors.horizontalCenter: services.horizontalCenter
                anchors.verticalCenter: services.verticalCenter
                anchors.verticalCenterOffset: 5.5
                anchors.horizontalCenterOffset: 5.5
                fillMode: Image.PreserveAspectFit
                visible: false
//                source: "/HU_Assets/Background/select_menu.png"
                source: clickNotifier.clicked ? "HU_Assets/light/Background/select_menu_l.png" : "HU_Assets/Background/select_menu.png"
            }

            Rectangle {
                id: services
                x: 42
                y: 246
                width: 101
                height: 25
                color: "#00000000"

                Image {
                    id: service_icon
                    x: 0
                    y: 0
                    anchors.verticalCenter: services.verticalCenter
                    anchors.left: services.left
//                    source: "HU_Assets/Icons/service.png"
                    source: clickNotifier.clicked ? "HU_Assets/light/Icons/service_l.png" : "HU_Assets/Icons/service.png"
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: service_text
//                    color: "#ffffff"
                    color: clickNotifier.clicked ? "#414141" : "#ffffff"
                    text: qsTr("Services")
                    anchors.right: services.right
                    anchors.verticalCenter: services.verticalCenter
                    font.pixelSize: 17
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
//                        bluetoothQmlLoader.active = true;

//                        bluetoothQmlLoader.item.visible = true;
//                        bluetoothQmlLoader.item.x = setting_window.x + 200;
//                        bluetoothQmlLoader.item.y = setting_window.y + 14;
//                        bluetoothQmlLoader.visible = true;
//                        bluetoothQmlLoader.x = setting_window.x - 193;
//                        bluetoothQmlLoader.y = setting_window.y - 26;
                        service_selected.visible = true;

                        if (bluetoothQmlLoader.item){
                            bluetoothQmlLoader.item.visible = !bluetoothQmlLoader.item.visible;
                            bluetoothQmlLoader.item.x = setting_window.x - 193;
                            bluetoothQmlLoader.item.y = setting_window.y - 26;
                        }
                    }
                }
            }

        }
    }

    Loader{
        id: infoQmlLoader
        asynchronous: false
        source: "usrinfo_page.qml"
        active: true
        visible: true
        onLoaded: {
            if (item){
                item.visible = false;
            }

        }
    }

    Loader{
        id: lightQmlLoader
        asynchronous: false
        source: "light_page.qml"
        active: true
        visible: true
        onLoaded: {
//            lightQmlLoader.item.visible = false;

//            lightQmlLoader.visible = false;

            if (item){
                item.visible = false;
            }
        }
    }

    Loader{
        id: bluetoothQmlLoader
        asynchronous: false
        source: "bluetooth_page.qml"
        active: true
        visible: true
        onLoaded: {
//            bluetoothQmlLoader.item.visible = false;
//            bluetoothQmlLoader.visible = false;
            if (item){
                item.visible = false;
            }
        }
    }

    Image {
        id: window_close_button
        x: 550
        y: 20
        width: 50
        height: 50
        fillMode: Image.PreserveAspectFit
        source: "HU_Assets/Icons/tap_close_button.png"
//        source: "HU_Assets/Icons/back.png"
//        source: clickNotifier.clicked ? "HU_Assets/light/Icons/close_icon_l.png" : "HU_Assets/Icons/tap_close_button.png"

        MouseArea{
            anchors.fill: parent
            onClicked: {
                setting_window.visible = false;
//                settingQmlLoader.active = false;
                icon_line.x = 138;
            }
        }
    }
}
