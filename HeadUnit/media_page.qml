import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import QtMultimedia 5.12

Rectangle{
    id: media_window
    visible: true
    width: 618
    height: 480
    color: "transparent"
//    flags: Qt.FramelessWindowHint
    Component.onCompleted: {
        select_video.visible = true;
        selected_video_display.visible = false;
        video_controls.visible = true;
    }

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

        Rectangle{
            id: select_video
            x: 10
            y: 17
//            color: "#323232"
            color: clickNotifier.clicked ? "#00000000" : "#323232"
            width: 600
            height: 450

            Image {
                id: window_close_button
                x: 530
                y: 6
                width: 50
                height: 50
                fillMode: Image.PreserveAspectFit
                source: "HU_Assets/Icons/tap_close_button.png"
//                source: clickNotifier.clicked ? "HU_Assets/light/Icons/close_icon_l.png" : "HU_Assets/Icons/close_icon.png"


                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        media_window.visible = false;
                        mediaQmlLoader.active = false;
                        icon_line.x = 138;
                    }
                }
            }

            Rectangle {
                id: library
                x: 18
                y: 15
                width: 164
                height: 30
                color: "transparent"

                Image {
                    id: library_icon
                    width: 28
                    anchors.verticalCenterOffset: 1
                    anchors.leftMargin: -1
//                    source: "HU_Assets/Icons/library.png"
                    source: clickNotifier.clicked ? "HU_Assets/light/Icons/library_l.png" : "HU_Assets/Icons/library.png"
                    fillMode: Image.PreserveAspectFit
                    anchors{
                        verticalCenter: library.verticalCenter
                        left: library.left
                    }
                }
                Text {
                    id: library_text
                    x: 47
                    width: 131
                    height: 22
                    text: qsTr("Your Library")
                    font.pixelSize: 23
//                    color: "#ffffff"
                    color: clickNotifier.clicked ? "#414141" : "#ffffff"
                    anchors{
                        verticalCenter: library.verticalCenter
                        right: library.right
                        bottom: library.bottom
                    }
                }
            }

            Rectangle {
                id: base_line
                x: 18
                y: 56
                width: 565
                height: 2
                color: "#424343"
            }

            Grid {
                id: video_grid
                x: 20
                y: 76
                width: 560
                height: 361
                spacing: 20
                rows: 2
                columns: 2

                Rectangle {
                    id: video_1
                    width: 270
                    height: 170
                    color: "transparent"

                    Image {
                        id: video1_thumbnail
                        width: 270
                        height: 135
                        source: "Thumbnail/Pomeranian_Grooming_Teddy_bear_style.png"
                        fillMode: Image.Stretch
                    }
                    Text {
                        id: video1_title
                        text: qsTr("Pomeranian Grooming Teddy bear style")
//                        color: "#ffffff"
                        color: clickNotifier.clicked ? "#414141" : "#ffffff"
                        font.pixelSize: 13
                        anchors{
                            bottom: video_1.bottom
                            bottomMargin: 16
                        }
                    }
                    Text {
                        id: video1_channel
                        text: qsTr("SHU AND TREE")
                        color: "#CBC8C8"
                        font.pixelSize: 11
                        anchors{
                            bottom: video_1.bottom
                        }
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            video_player.source = "file:///media/llj/SanDisk/Video/SHU_AND_TREE.mp4";
                            selected_video_display.visible = true;
                            video_player.visible = true;
                            video_player.play();
                            video_controls.visible = true;
                        }
                    }
                }

                Rectangle {
                    id: video_2
                    width: 270
                    height: 170
                    color: "#00000000"
                    Image {
                        id: video2_thumbnail
                        width: 270
                        height: 135
                        source: "Thumbnail/Once_upon_a_time_there_was_one_cutest_kitten.png"
                        fillMode: Image.Stretch
                    }

                    Text {
                        id: video2_title
//                        color: "#ffffff"
                        color: clickNotifier.clicked ? "#414141" : "#ffffff"
                        text: qsTr("Once upon a time there was one cutest kitten")
                        anchors.bottomMargin: 16
                        font.pixelSize: 13
                        anchors.bottom: video_2.bottom
                    }

                    Text {
                        id: video2_channel
                        color: "#cbc8c8"
                        text: qsTr("Teddy Kittens")
                        font.pixelSize: 11
                        anchors.bottom: video_2.bottom
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            video_player.source = "file:///media/llj/SanDisk/Video/Teddy_Kittens.mp4";
                            selected_video_display.visible = true;
                            video_player.visible = true;
                            video_player.play();
                            video_controls.visible = true;
                        }
                    }
                }

                Rectangle {
                    id: video_3
                    width: 270
                    height: 170
                    color: "#00000000"
                    Image {
                        id: video3_thumbnail
                        width: 270
                        height: 135
                        source: "Thumbnail/World_premiere-The_all_new_Tayron.png"
                        fillMode: Image.Stretch
                    }

                    Text {
                        id: video3_title
//                        color: "#ffffff"
                        color: clickNotifier.clicked ? "#414141" : "#ffffff"
                        text: qsTr("World_premiere-The_all_new_Tayron")
                        anchors.bottomMargin: 16
                        font.pixelSize: 13
                        anchors.bottom: video_3.bottom
                    }

                    Text {
                        id: video3_channel
                        color: "#cbc8c8"
                        text: qsTr("Volkswagen")
                        font.pixelSize: 11
                        anchors.bottom: video_3.bottom
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            video_player.source = "file:///media/llj/SanDisk/Video/Volkswagen.mp4";
                            selected_video_display.visible = true;
                            video_player.visible = true;
                            video_player.play();
                            video_controls.visible = true;
                        }
                    }
                }
            }
        } // select_video

        Rectangle{
            id: selected_video_display
            x: 10
            y: 17
//            color: "#323232"
            color: clickNotifier.clicked ? "#ffffff" : "#323232"
            width: 600
            height: 450

            Video{
                id: video_player
                visible: false
                width: 600
                height: 330
                anchors.verticalCenterOffset: -17
                anchors.horizontalCenterOffset: 0
                anchors.centerIn: parent
                source: ""
                autoPlay: true

                onPlaying: {
                    video_controls.visible = true;
                }

                onPaused: {
                    video_controls.visible = true;
                }

                onStopped: {
                    select_video.visible = true;
                    selected_video_display.visible = false;
                }
            }

            Rectangle{
                id: video_controls
                width: 600
                height: 50
                color: "transparent"
                anchors{
                    top: video_player.bottom
                    topMargin: 10
                    horizontalCenter: video_player.horizontalCenter
                }
                visible: false

                Row{
                    id: video_controls_bar
                    width: 500
                    height: 40
                    spacing: 15
                    anchors.centerIn: parent

                    Image {
                        source: video_player.playbackState === MediaPlayer.PlayingState ? "HU_Assets/Components/Video/stop_icon.png" : "HU_Assets/Components/Video/play_icon.png"
                        width: 30
                        height: 30
                        anchors.top: parent.top
                        anchors.topMargin: 1
//                        anchors{
//                            top: video_controls_bar.top
//                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                if (video_player.playbackState === MediaPlayer.PlayingState) {
                                    video_player.pause();
                                } else {
                                    video_player.play();
                                }
                            }
                        }
                    }

                    Image {
//                        source: "HU_Assets/Components/Video/skip_prev_icon.png"
                        source: clickNotifier.clicked ? "HU_Assets/light/Components/Video/skip_prev_icon_l.png" : "HU_Assets/Components/Video/skip_prev_icon.png"
                        width: 30
                        height: 30
                        MouseArea {
                            anchors.fill: parent
        //                        onClicked: {
        //                            // Logic for skipping to the previous video
        //                            video_player.source = "Videos/Pomeranian_Grooming.mp4";
        //                            video_player.play();
        //                        }
                        }
                    }

                    Image {
//                        source: "HU_Assets/Components/Video/skip_next_icon.png"
                        source: clickNotifier.clicked ? "HU_Assets/light/Components/Video/skip_next_icon_l.png" : "HU_Assets/Components/Video/skip_next_icon.png"
                        width: 30
                        height: 30
                        MouseArea {
                            anchors.fill: parent
        //                        onClicked: {
        //                            // Logic for skipping to the next video
        //                            video_player.source = "Videos/Next_Video.mp4";
        //                            video_player.play();
        //                        }
                        }
                    }

                    Rectangle{
                        color: "transparent"
                        width: 180
                        height: 30
                    }

                    Rectangle{
                        id: sound_control
                        width: 130
                        height: 30
                        color: "transparent"

                        Image {
//                            source: "HU_Assets/Components/Video/sound_icon.png"
                            source: clickNotifier.clicked ? "HU_Assets/light/Components/Video/sound_icon_l.png" : "HU_Assets/Components/Video/sound_icon.png"
                            width: 30
                            height: 30
                            anchors{
                                left: sound_control.left
                            }
                            MouseArea{
                                anchors.fill: parent
                                onClicked: {
                                    volume_slider.value = 0
                                }
                            }
                        }

                        Slider {
                            id: volume_slider
                            width: 100
                            value: video_player.volume
                            onValueChanged: video_player.volume = value
                            anchors.top: parent.top
                            anchors.topMargin: -2
                            anchors.right: sound_control.right

                            background: Rectangle {
                                x: volume_slider.leftPadding
                                y: volume_slider.topPadding + volume_slider.availableHeight / 2 - height / 2
                                implicitWidth: 200
                                implicitHeight: 4
                                width: volume_slider.availableWidth
                                height: implicitHeight
                                radius: 2
                                color: "#bdbebf"

                                Rectangle {
                                    width: volume_slider.visualPosition * parent.width
                                    height: parent.height
                                    color: clickNotifier.clicked ? "#414141" : "#ffffff"
                                    radius: 2
                                }
                            }

                            handle: Rectangle {
                                x: volume_slider.leftPadding + volume_slider.visualPosition * (volume_slider.availableWidth - width)
                                y: volume_slider.topPadding + volume_slider.availableHeight / 2 - height / 2
                                implicitWidth: 20
                                implicitHeight: 20
                                radius: 13
                                color: volume_slider.pressed ? "#f0f0f0" : "#f6f6f6"
                                border.color: "#bdbebf"
                            }
                        }
                    }

                    Image {
//                        source: "HU_Assets/Components/Video/screen_off_icon.png"
                        source: clickNotifier.clicked ? "HU_Assets/light/Components/Video/screen_off_icon_l.png" : "HU_Assets/Components/Video/screen_off_icon.png"
                        width: 30
                        height: 30
                        anchors.top: parent.top
                        anchors.topMargin: -2
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                video_player.stop();
        //                        video_player.visible = false;
        //                        video_controls.visible = false;
                            }
                        }
                    }
                }
            }
        }
    } // base_window
}




