import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12


Rectangle{
    id: usrinfo_window
    visible: true
    width: 413
    height: 445
    color: "transparent"



    Image {
        id: info_close_button
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
                usrinfo_window.visible = false;
                usrinfo_selected.visible = false;
            }
        }
        Connections {
            target: usrinfo_selected
        }
    }

    Image {
            id: info_pic
            x: 57
            y: 61
            width: 300
            height: 200
            fillMode: Image.PreserveAspectFit
            source: "HU_Assets/Team02.jpeg"
    }
    Rectangle {
            id: infotxt_rec
            x: 0
            width: 405
            height: 150
            color: "#00000000"
            anchors.top: info_pic.bottom
            anchors.topMargin: 16

            Flickable {
                id: info_flickable
                x: 10
                width: parent.width - 20
                height: parent.height
                contentWidth: info_flickable.width
                contentHeight: info_column.height


                Column {
                    id: info_column
                    width: flickableArea.width
                    spacing: 10

                    Text {
                        id: team_name
                        text: qsTr("SEA:ME Team02")
                        font.pixelSize: 20
                        color: clickNotifier.clicked ? "#414141" : "white"
                    }

                    Text {
                        id: eunji
                        text: qsTr("Eunji - LinkedIn: EunJi Lee, Github: iznue")
                        color: clickNotifier.clicked ? "#414141" : "white"
                    }
                    Text {
                        id: soonwoong
                        text: qsTr("Soonwoong - LinkedIn: Soonwoong Kim, Github: mechsoon")
                        color: clickNotifier.clicked ? "#414141" : "white"
                    }
                    Text {
                        id: seungjoo
                        text: qsTr("Seungjoo - LinkedIn: Seung-Joo Kim, Github: programerKim")
                        color: clickNotifier.clicked ? "#414141" : "white"
                    }
                    Text {
                        id: seokhun
                        text: qsTr("Seokhun - LinkedIn: SEOKHUN CHO, Github: johook")
                        color: clickNotifier.clicked ? "#414141" : "white"
                    }
                    Text {
                        id: yeongyoo
                        text: qsTr("Yeongyoo - LinkedIn: Yeongyoo Jo, Github: jo49973477")
                        color: clickNotifier.clicked ? "#414141" : "white"
                    }
                }
            }
        }


}
