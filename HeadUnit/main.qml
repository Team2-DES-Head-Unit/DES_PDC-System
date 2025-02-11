import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
//import QtQuick.mirroring 1.0
//import timeprovider 1.0

Window {
    id: main_window
    visible: true
    width: 1024
    height: 600
//    color: "#1E1E1E"
    color: clickNotifier.clicked ? "#FCFCFC" : "#1E1E1E"
    title: qsTr("Head Unit")
//    flags: Qt.FramelessWindowHint
    visibility: Window.FullScreen

    property bool isBluetoothConnected: false

    Component.onCompleted: { // initial setting
        weatherProvider.cityName = "Wolfsburg";
        musicQmlLoader.active = true;
//        p.color = (clickNotifier.clicked) ? "#7788F2" : "#87F1D0"
    }

    Connections{
        target: musicPlayer
        onNextSongInfo:{
            console.log("Title: " + title);
            console.log("Artist: " + artist);
            console.log("Cover Path: " + coverPath);
            song_title.text = title;
            singer_txt.text = artist;
            album_cover.source = coverPath;
            play_button.visible = false;
            stop_button.visible = true;
        }

        onMusicProgressChanged: {
            //                console.log(musicPlayer.music_position());
            //                console.log(musicPlayer.music_duration());
            music_progress_fill.width = (parseFloat(musicPlayer.music_position() / musicPlayer.music_duration()) * music_progress_bar.width)
            music_start.text = formatTime(musicPlayer.music_position())
            music_end.text = formatTime(musicPlayer.music_duration())
        }

        onMusicPauseButton:{
            play_button.visible = true;
            stop_button.visible = false;
        }

        onMusicPlayButton:{
            play_button.visible = false;
            stop_button.visible = true;
        }
    }

    /////////////////////////////////////////////////////////////////////// car status
    Item {
        id: root

        property double totalDistance: 0
        property int elapsedTime: 0
        property double averageSpeed: 0

        Timer{
            id: updateTimer
            interval: 1000
            repeat: true
            running: true
            onTriggered: {
                if (Receiver.speedKmh > 0){
                    root.elapsedTime += 1;
                    root.totalDistance += Receiver.speedKmh / 3600;
                    root.averageSpeed = root.totalDistance / (root.elapsedTime / 3600);
                }
            }
        }
    }

    Image {
        id: car_status_background
        x: 0
        y: 0
        fillMode: Image.PreserveAspectFit
//        source: "HU_Assets/Background/car_status_background.png"
        source: clickNotifier.clicked ? "HU_Assets/light/Background/car_status_background_l.png" : "HU_Assets/Background/car_status_background.png"

        Image {
            id: progress_bar
            x: 60
            y: 42
            fillMode: Image.PreserveAspectFit
//            source: "HU_Assets/Background/progress_bar.png"
            source: clickNotifier.clicked ? "HU_Assets/light/Background/progress_bar_l.png" : "HU_Assets/Background/progress_bar.png"

            Rectangle {
                id: speed_info
                x: 95
                y: 58
                width: 70
                height: 70
                color: "transparent"

                Text {
                    id: speed_value
                    horizontalAlignment: Text.AlignHCenter
                    width: 70
                    height: 50
                    font.pixelSize: 48
//                    color: "#ffffff"
                    color: clickNotifier.clicked ? "#414141" : "#ffffff"
//                    text: speedProvider.currentSpeed    //qsTr("75")
                    text: Receiver.speedKmh.toFixed(0)
                    anchors.verticalCenterOffset: -10
                    anchors.horizontalCenterOffset: 0
                }

                Text {
                    id: km_h
                    horizontalAlignment: Text.AlignHCenter
                    anchors{
                        top: speed_value.bottom
                    }
                    width: 70
                    height: 20
                    text: qsTr("km/h")
                    font.pixelSize: 20
//                    color: "#ffffff"
                    color: clickNotifier.clicked ? "#414141" : "#ffffff"
                }
            }
        }
        Connections{
//            target: speedProvider
//            onSpeedChanged: {
//                speed_value.text = speedProvider.currentSpeed
//            }
            target: Receiver
            onSpeedChanged: {
                speed_value.text = Receiver.speedKmh
            }
        }

        ///////////////////////////////////////////////////////////////// status info
        Rectangle {
            id: car_status_info
            x: 25
            y: 180
            width: 330
            height: 35
            color: "transparent"

            Rectangle {
                id: average
                anchors.left: car_status_info.left
                width: 95
                height: 35
                color: "transparent"

                Text {
                    id: sa_value
                    width: 48
                    height: 23
//                    text: qsTr("128")
                    text: root.averageSpeed.toFixed(2)
//                    color: "#ffffff"
                    color: clickNotifier.clicked ? "#414141" : "#ffffff"
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    anchors{
                        left: average.left
                        top: average.top
                    }
                }

                Text {
                    id: sa_scale
                    width: 48
                    height: 15
                    text: qsTr("km/h")
//                    color: "#ffffff"
                    color: clickNotifier.clicked ? "#414141" : "#ffffff"
                    font.pixelSize: 9
                    horizontalAlignment: Text.AlignHCenter
                    anchors{
                        left: average.left
                        bottom: average.bottom
                        bottomMargin: -2
                    }
                }

                Text {
                    id: text_speed
                    text: qsTr("Speed")
//                    color: "#ffffff"
                    color: clickNotifier.clicked ? "#414141" : "#ffffff"
                    font.pixelSize: 10
                    horizontalAlignment: Text.AlignRight
                    anchors{
                        right: average.right
                        top: average.top
                        topMargin: 5
                    }
                }

                Text {
                    id: text_average
                    text: qsTr("Average")
//                    color: "#ffffff"
                    color: clickNotifier.clicked ? "#414141" : "#ffffff"
                    font.pixelSize: 11
                    horizontalAlignment: Text.AlignRight
                    anchors{
                        right: average.right
                        bottom: average.bottom
                    }
                }
            }

            Rectangle {
                id: mileage
                x: 0
                y: 0
                width: 95
                height: 35
                color: "#00000000"
                anchors.leftMargin: 122
                anchors.left: car_status_info.left

                Text {
                    id: m_value
                    width: 48
                    height: 23
//                    color: "#ffffff"
                    color: clickNotifier.clicked ? "#414141" : "#ffffff"
//                    text: qsTr("36.56")
                    text: root.totalDistance.toFixed(2)
                    font.pixelSize: 18
                    anchors.top: mileage.top
                    horizontalAlignment: Text.AlignHCenter
                    anchors.left: mileage.left
                }

                Text {
                    id: m_scale
                    width: 48
                    height: 15
//                    color: "#ffffff"
                    color: clickNotifier.clicked ? "#414141" : "#ffffff"
                    text: qsTr("km")
                    anchors.bottom: mileage.bottom
                    font.pixelSize: 9
                    anchors.bottomMargin: -2
                    horizontalAlignment: Text.AlignHCenter
                    anchors.left: mileage.left
                }

                Text {
                    id: text_remaining
//                    color: "#ffffff"
                    color: clickNotifier.clicked ? "#414141" : "#ffffff"
                    text: qsTr("Remaining")
                    anchors.topMargin: 5
                    font.pixelSize: 9
                    anchors.right: mileage.right
                    anchors.top: mileage.top
                    horizontalAlignment: Text.AlignRight
                }

                Text {
                    id: text_mileage
//                    color: "#ffffff"
                    color: clickNotifier.clicked ? "#414141" : "#ffffff"
                    text: qsTr("Mileage")
                    anchors.bottom: mileage.bottom
                    font.pixelSize: 11
                    anchors.right: mileage.right
                    horizontalAlignment: Text.AlignRight
                }
            }

            Rectangle {
                id: time
                x: -4
                y: 0
                width: 88
                height: 35
                color: "#00000000"
                anchors.left: car_status_info.left
                anchors.leftMargin: 228
                Text {
                    id: t_value
                    width: 48
                    height: 23
//                    color: "#ffffff"
                    color: clickNotifier.clicked ? "#414141" : "#ffffff"
//                    text: qsTr("20")
                    text: root.elapsedTime & 60
                    font.pixelSize: 18
                    anchors.top: time.top
                    horizontalAlignment: Text.AlignHCenter
                    anchors.left: time.left
                }

                Text {
                    id: t_scale
                    width: 48
                    height: 15
//                    color: "#ffffff"
                    color: clickNotifier.clicked ? "#414141" : "#ffffff"
                    text: qsTr("hour")
                    anchors.bottom: time.bottom
                    anchors.bottomMargin: -2
                    font.pixelSize: 9
                    horizontalAlignment: Text.AlignHCenter
                    anchors.left: time.left
                }

                Text {
                    id: text_remaining1
//                    color: "#ffffff"
                    color: clickNotifier.clicked ? "#414141" : "#ffffff"
                    text: qsTr("Remaining")
                    anchors.topMargin: 5
                    font.pixelSize: 9
                    anchors.right: time.right
                    anchors.top: time.top
                    horizontalAlignment: Text.AlignRight
                }

                Text {
                    id: text_time
//                    color: "#ffffff"
                    color: clickNotifier.clicked ? "#414141" : "#ffffff"
                    text: qsTr("Time")
                    anchors.bottom: time.bottom
                    font.pixelSize: 11
                    anchors.right: time.right
                    horizontalAlignment: Text.AlignRight
                }
            }

            Image {
                id: line1
                x: 111
                y: -3
                fillMode: Image.PreserveAspectFit
//                source: "HU_Assets/Components/line.png"
                source: clickNotifier.clicked ? "HU_Assets/light/Components/line_l.png" : "HU_Assets/Components/line.png"
            }

            Image {
                id: line2
                x: 228
                y: -3
                fillMode: Image.PreserveAspectFit
//                source: "HU_Assets/Components/line.png"
                source: clickNotifier.clicked ? "HU_Assets/light/Components/line_l.png" : "HU_Assets/Components/line.png"
            }
        }

        ///////////////////////////////////////////////////////////////// gear
        Rectangle {
            id: gear_selection
            x: 110
            y: 442
            width: 160
            height: 60
            color: "transparent"

            property string currentGear: "P"

            Row {
                id: gear_list
                anchors.centerIn: parent
                spacing: 15

                Text {
                    id: p
                    text: qsTr("P")
                    font.pixelSize: 30
//                    color: "#959595"
//                    color: client.gear === 1 ? "#87F1D0" : "#939395"
                    color: (clickNotifier.clicked) ? (client.gear === 1 ? "#7788F2" : "#939395") : (client.gear === 1 ? "#87F1D0" : "#939395")
                }

                Text {
                    id: r
                    text: qsTr("R")
                    font.pixelSize: 30
//                    color: client.gear === 3 ? "#87F1D0" : "#939395"
                    //                        color: currentGear === "R" ? "#87F1D0" : "#959595"
                    color: (clickNotifier.clicked) ? (client.gear === 3 ? "#7788F2" : "#939395") : (client.gear === 3 ? "#87F1D0" : "#939395")
                }

                Text {
                    id: n
                    text: qsTr("N")
                    font.pixelSize: 30
//                    color: client.gear === 4 ? "#87F1D0" : "#939395"
                    //                        color: currentGear === "N" ? "#87F1D0" : "#959595"
                    color: (clickNotifier.clicked) ? (client.gear === 4 ? "#7788F2" : "#939395") : (client.gear === 4 ? "#87F1D0" : "#939395")
                }

                Text {
                    id: d
                    text: qsTr("D")
                    font.pixelSize: 30
//                    color: client.gear === 2 ? "#87F1D0" : "#939395"
                    //                        color: currentGear === "D" ? "#87F1D0" : "#959595"
                    color: (clickNotifier.clicked) ? (client.gear === 2 ? "#7788F2" : "#939395") : (client.gear === 2 ? "#87F1D0" : "#939395")
                }
            }
        }

        ///////////////////////////////////////////////////////////////// battery
//        Rectangle {
//            id: battery_component
//            x: 303
//            y: 15
//            width: 61
//            height: 13
//            color: "transparent"

//            Image {
//                id: battery_img
//                width: 30
//                fillMode: Image.PreserveAspectFit
//                source: "HU_Assets/Components/battery.png"
//                anchors.right: battery_component.right
//            }

//            Text {
//                id: battery_value
//                text: qsTr("90%")
//                font.pixelSize: 12
////                color: "#ffffff"
//                color: clickNotifier.clicked ? "#414141" : "#ffffff"
//                anchors.left: battery_component.left
//            }
//        }
    }

    /////////////////////////////////////////////////////////////////////// basic page

    ///////////////////////////////////////////////////////////////// weather_component
    Rectangle {
        id: weather_component
        x: 438
        y: 92
        width: 240
        height: 220
        radius: 15
//        color: "#323232"
        color: clickNotifier.clicked ? "#F2F2F2" : "#323232"

        Text {
            id: climate
            x: 24
            y: 18
            text: qsTr("Climate")
            font.pixelSize: 23
//            color: "#ffffff"
            color: clickNotifier.clicked ? "#414141" : "#ffffff"
        }

        Text {
            id: tempLabel
            x: 18
            y: 79
            text: weatherProvider.temperature
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 35
//            color: "#ffffff"
            color: clickNotifier.clicked ? "#414141" : "#ffffff"
        }

        Text {
            id: cityLabel
            x: 24
            y: 125
            text: weatherProvider.cityName
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 20
//            color: "#ffffff"
            color: clickNotifier.clicked ? "#414141" : "#ffffff"
        }

        Rectangle {
            id: temperatureBar
            x: 20
            y: 189
            width: 200
            height: 5
            color: "transparent"

            Rectangle {
                id: temp_range
                x: 0
                y:0
                width: 200
                height: 5
//                color: "#ffffff"
                color: clickNotifier.clicked ? "#414141" : "#ffffff"
                radius: 10
            }

            Rectangle {
                id: temp_bar
//                color: "#03A49A"
                color: clickNotifier.clicked ? "#7788F2" : "#03A49A"
                width: (weatherProvider.temperature.toDouble() + 20) / 60 * parent.width // range : -20 ~ 40
                height: parent.height
                radius: 10
            }

            Image {
                id: temp_fan
                x: temp_bar.width - 12.5
                y: temp_bar.y - 9
//                source: "HU_Assets/Components/Weather/climate_fan.png"
                source: clickNotifier.clicked ? "HU_Assets/light/Components/Weather/climate_fan_l.png" : "HU_Assets/Components/Weather/climate_fan.png"
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: min_range
                x: 1
                y: -22
                text: qsTr("-20°C")
                font.pixelSize: 13
                color: "#87888C"
            }

            Text {
                id: max_range
                x: 173
                y: -22
                text: qsTr("40°C")
                font.pixelSize: 13
                color: "#87888C"
            }
        }

        Connections {
            target: weatherProvider
            onTemperatureChanged: {
                temp_bar.width = (parseFloat(weatherProvider.temperature) + 20) / 60 * temperatureBar.width
            }
        }

    }
//    Component.onCompleted: { // initial setting
//        weatherProvider.cityName = "Wolfsburg";
//    }

    ///////////////////////////////////////////////////////////////// calender_component
    Rectangle {
        id: calender_component
        x: 724
        y: 92
        width: 240
        height: 220
        radius: 15
//        color: "#323232"
        color: clickNotifier.clicked ? "#F2F2F2" : "#323232"

        Text {
            id: calender
            x: 24
            y: 18
            text: qsTr("My Calender")
            font.pixelSize: 23
//            color: "#ffffff"
            color: clickNotifier.clicked ? "#414141" : "#ffffff"
        }
        Text {
            id: day
            x: 25
            y: 51
            text: timeProvider.currentDate // need to fix - add today's date
            font.pixelSize: 15
            color: "#87888C"
        }
        Connections { // when timeChanged occurs, update time
            target: timeProvider
            onTimeChanged: day.text = timeProvider.currentDate
        }

        Text {
            id: time_1
            x: 12
            y: 94
            text: "14:00"
            font.pixelSize: 12
            color: "#87888C"
        }
        Text {
            id: time_2
            x: 12
            y: 146
            text: "15:00"
            font.pixelSize: 12
            color: "#87888C"
        }

        Text {
            id: time_3
            x: 12
            y: 197
            color: "#87888c"
            text: "16:00"
            font.pixelSize: 12
        }

        Image {
            id: calender_comp
            x: 54
            y: 94
//            source: "HU_Assets/Components/Calender/calender_component.png"
            source: clickNotifier.clicked ? "HU_Assets/light/Components/Calender/calender_component_l.png" : "HU_Assets/Components/Calender/calender_component.png"
            fillMode: Image.PreserveAspectFit

            Text {
                id: schedule
                x: 21
                y: 10
                text: "Meeting with staffs"
                font.pixelSize: 15
//                color: "#ffffff"
                color: clickNotifier.clicked ? "#414141" : "#ffffff"
            }
            Text {
                id: schedule_time
                x: 22
                y: 35
                text: "14:00 - 15:00"
                font.pixelSize: 13
                color: "#87888C"
            }
        }

        Image {
            id: calender_bar
            x: 0
            y: 70
//            source: "HU_Assets/Components/Calender/calender_bar.png"
            source: clickNotifier.clicked ? "HU_Assets/light/Components/Calender/calender_bar_l.png" : "HU_Assets/Components/Calender/calender_bar.png"
            fillMode: Image.PreserveAspectFit
        }

    }

    ///////////////////////////////////////////////////////////////// music_component
    property string songTitle: "Hanumankind-Big_Dawgs.mp3"
    property string musicPath: ""

    function formatTime(ms){
        var total_sec = Math.floor(ms / 1000);
        var min = Math.floor(total_sec / 60);
        var sec = total_sec % 60;
        return min + ":" + (sec < 10 ? "0" + sec : sec);
    }

    Rectangle {
        id: music_component
        x: 438
        y: 359
        width: 526
        height: 116
        radius: 15
//        color: "#323232"
        color: clickNotifier.clicked ? "#F2F2F2" : "#323232"

        Rectangle {
            id: cover
            x: 21
            y: 17
            width: 82
            height: 82
//            color: "#ffffff"
            color: clickNotifier.clicked ? "#414141" : "#ffffff"
            radius: 15
            clip: true
            Image {
                id: album_cover
                anchors.rightMargin: 0
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: musicPlayer.getCoverForSong(songTitle)
                smooth: true
            }
        }

        Text {
            id: song_title
            x: 123
            y: 23
            text: musicPlayer.getTitleForSong(songTitle)
            font.pixelSize: 17
//            color: "#ffffff"
            color: clickNotifier.clicked ? "#414141" : "#ffffff"
            Component.onCompleted: console.log("current song title: " + songTitle)
        }
        Text {
            id: singer_txt
            x: 123
            y: 56
            text: musicPlayer.getArtistForSong(songTitle)
            font.pixelSize: 15
            color: "#87888C"
        }


        Row{
            id: music_menu
            x: 303
            y: 21
            spacing: 55

            Image {
                id: skip_back
                anchors.verticalCenter: music_menu.verticalCenter
                fillMode: Image.PreserveAspectFit
//                source: "HU_Assets/Components/Music/skip_back.png"
                source: clickNotifier.clicked ? "HU_Assets/light/Components/Music/skip_back_l.png" : "HU_Assets/Components/Music/skip_back.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        musicPlayer.skipPrevious();
//                        play_button.visible = false;
//                        stop_button.visible = true;
                    }
                }
            }

//            Image {
//                id: skip_back2
//                anchors.verticalCenter: music_menu.verticalCenter
//                fillMode: Image.PreserveAspectFit
//                source: "HU_Assets/Components/Music/skip_back2.png"
//            }

            Image {
                id: music_button
                anchors.verticalCenter: music_menu.verticalCenter
                fillMode: Image.PreserveAspectFit
//                source: "HU_Assets/Components/Music/music_button_ring.png"
                source: clickNotifier.clicked ? "HU_Assets/light/Components/Music/music_button_ring_l.png" : "HU_Assets/Components/Music/music_button_ring.png"
                Component.onCompleted: {
                    musicPath = musicPlayer.getPathForSong(songTitle);
                    console.log("file path : " + musicPath);
                    musicPlayer.setMusic(musicPath)
                }

                Image {
                    id: play_button
                    anchors.verticalCenterOffset: 1
                    anchors.horizontalCenterOffset: 1
                    anchors{
                        verticalCenter: music_button.verticalCenter
                        horizontalCenter: music_button.horizontalCenter
                    }
                    fillMode: Image.PreserveAspectFit
//                    source: "HU_Assets/Components/Music/play.png"
                    source: clickNotifier.clicked ? "HU_Assets/light/Components/Music/play_l.png" : "HU_Assets/Components/Music/play.png"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            console.log("play button")
                            musicPlayer.playMusic(musicPath);
//                            play_button.visible = false;
//                            stop_button.visible = true;
                            console.log("Current play state: " + musicPlayer.playState());
                        }
                    }
                }
                Image {
                    id: stop_button
                    anchors.verticalCenterOffset: 0
                    anchors.horizontalCenterOffset: 1
                    anchors.centerIn: music_button
                    fillMode: Image.PreserveAspectFit
//                    source: "HU_Assets/Components/Music/stop.png"
                    source: clickNotifier.clicked ? "HU_Assets/light/Components/Music/stop_l.png" : "HU_Assets/Components/Music/stop.png"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            console.log("stop button")
                            musicPlayer.pauseMusic();
//                            stop_button.visible = false;
//                            play_button.visible = true;
                            console.log("Current play state: " + musicPlayer.playState());
                        }
                    }
                }
            }

//            Image {
//                id: skip_front2
//                anchors.verticalCenter: music_menu.verticalCenter
//                fillMode: Image.PreserveAspectFit
//                source: "HU_Assets/Components/Music/skip_front2.png"
//            }

            Image {
                id: skip_front
                anchors.verticalCenter: music_menu.verticalCenter
                fillMode: Image.PreserveAspectFit
//                source: "HU_Assets/Components/Music/skip_front.png"
                source: clickNotifier.clicked ? "HU_Assets/light/Components/Music/skip_front_l.png" : "HU_Assets/Components/Music/skip_front.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        musicPlayer.skipNext();
//                        play_button.visible = false;
//                        stop_button.visible = true;
                    }
                }
            }
            Component.onCompleted: {
                //                musicPlayer.playMusic(musicPlayer.getPathForSong(songTitle));
                play_button.visible = true;
                stop_button.visible = false;
                album_cover.source = "Cover/Hanumankind-cover.jpeg"
            }
        }

        Rectangle {
            id: music_progress_bar
            x: 303
            y: 85
            width: 194
            height: 5
            radius: 3
            color: "#87888C"
        }
        Rectangle {
            id: music_progress_fill
            width: (musicPlayer.music_position() / musicPlayer.music_duration()) * music_progress_bar.width
            height: music_progress_bar.height
            anchors{
                left: music_progress_bar.left
                verticalCenter: music_progress_bar.verticalCenter
            }
            radius: 3
//            color: "#87F1D0"
            color: clickNotifier.clicked ? "#7788F2" : "#87F1D0"
        }

        Text {
            id: music_start
            x: 303
            y: 64
            text: formatTime(musicPlayer.music_position()) // "0:00"
//            color: "#ffffff"
            color: clickNotifier.clicked ? "#414141" : "#ffffff"
            font.pixelSize: 12
        }
        Text {
            id: music_end
            x: 475
            y: 64
            text: formatTime(musicPlayer.music_duration())
//            color: "#ffffff"
            color: clickNotifier.clicked ? "#414141" : "#ffffff"
            font.pixelSize: 12
        }
//        Connections {
//            target: musicPlayer
//            onMusicProgressChanged: {
//                //                console.log(musicPlayer.music_position());
//                //                console.log(musicPlayer.music_duration());
//                music_progress_fill.width = (parseFloat(musicPlayer.music_position() / musicPlayer.music_duration()) * music_progress_bar.width)
//                music_start.text = formatTime(musicPlayer.music_position())
//                music_end.text = formatTime(musicPlayer.music_duration())
//            }
//        }

//        Image {
//            id: share_img
//            x: 499
//            y: 10
//            fillMode: Image.PreserveAspectFit
//            source: "HU_Assets/Icons/bluetooth.png"
//        }
    }

    Text {
        id: timeText
        x: 865
        y: 10
        text: timeProvider.currentTime
        font.pixelSize: 15
//        color: "#ffffff"
        color: clickNotifier.clicked ? "#414141" : "#ffffff"
    }

    Connections { // when timeChanged occurs, update time
        target: timeProvider
        onTimeChanged: timeText.text = timeProvider.currentTime
    }

    Rectangle{
        id: user_info
        color: "transparent"
        x: 940
        y: 10
        width: 70
        height: 17

        Image {
            id: user_icon
            anchors{
                top: user_info.top
                left: user_info.left
                topMargin: 2
            }
            fillMode: Image.PreserveAspectFit
//            source: "HU_Assets/Icons/person.png"
            source: clickNotifier.clicked ? "HU_Assets/light/Icons/person_l.png" : "HU_Assets/Icons/person.png"
        }

        Text {
            id: user_name
            width: 54
            anchors{
                left: user_icon.right
                leftMargin: 5
            }
            text: qsTr("Team02")
//            color: "#ffffff"
            color: clickNotifier.clicked ? "#414141" : "#ffffff"
            font.pixelSize: 15
        }
    }

    /////////////////////////////////////////////////////////////////////// main control bar
    Image {
        id: main_control_bar
        x: 0
        y: 537
        width: 1024
        height: 65
        fillMode: Image.PreserveAspectFit
//        source: "HU_Assets/Background/main_control_bar.png"
        source: clickNotifier.clicked ? "HU_Assets/light/Background/main_control_bar_l.png" : "HU_Assets/Background/main_control_bar.png"

        Rectangle{
            id: icon_list
            x: 354
            y: 14
            width: 316
            height: 38
            anchors.centerIn: main_control_bar
            color: "transparent"

            Image {
                id: icon_line
                fillMode: Image.PreserveAspectFit
//                source: "HU_Assets/Icons/icon_line.png"
                source: clickNotifier.clicked ? "HU_Assets/light/Icons/icon_line_l.png" : "HU_Assets/Icons/icon_line.png"
                x: 138
                y: 40
            }

            Row{
                id: icon_row
                anchors.centerIn: parent
                spacing: 37.65

                Image {
                    id: setting_icon
                    fillMode: Image.PreserveAspectFit
//                    source: "HU_Assets/Icons/settings.png"
                    source: clickNotifier.clicked ? "HU_Assets/light/Icons/settings_l.png" : "HU_Assets/Icons/settings.png"
                    width: 36
                    height: 36
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            icon_line.x = -8;
//                            settingQmlLoader.active = true;

//                            settingQmlLoader.item.visible = true;
//                            settingQmlLoader.item.x = main_window.x + 393;
//                            settingQmlLoader.item.y = main_window.y + 40;
//                            settingQmlLoader.visible = true;
//                            settingQmlLoader.x = main_window.x + 393;
//                            settingQmlLoader.y = main_window.y + 40;

                            if (settingQmlLoader.item){
                                settingQmlLoader.item.visible = !settingQmlLoader.item.visible;
                                settingQmlLoader.item.x = main_window.x + 393;
                                settingQmlLoader.item.y = main_window.y + 40;
                            }
                        }
                    }
                }

                Image {
                    id: map_icon
                    fillMode: Image.PreserveAspectFit
//                    source: "HU_Assets/Icons/map.png"
                    source: clickNotifier.clicked ? "HU_Assets/light/Icons/map_l.png" : "HU_Assets/Icons/map.png"
                    width: 36
                    height: 36
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            icon_line.x = 65;
                            mapQmlLoader.active = true;
//                            mapQmlLoader.item.visible = true;
//                            mapQmlLoader.item.x = main_window.x + 393;
//                            mapQmlLoader.item.y = main_window.y + 40;
                            mapQmlLoader.visible = true;
                            mapQmlLoader.x = main_window.x + 393;
                            mapQmlLoader.y = main_window.y + 40;
                        }
                    }
                }

                Image {
                    id: home_icon
                    fillMode: Image.PreserveAspectFit
//                    source: "HU_Assets/Icons/home.png"
                    source: clickNotifier.clicked ? "HU_Assets/light/Icons/home_l.png" : "HU_Assets/Icons/home.png"
                    width: 36
                    height: 36
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            icon_line.x = 138;
                        }
                    }
                }

                Image {
                    id: music_icon
                    fillMode: Image.PreserveAspectFit
//                    source: "HU_Assets/Icons/music.png"
                    source: clickNotifier.clicked ? "HU_Assets/light/Icons/music_l.png" : "HU_Assets/Icons/music.png"
                    width: 36
                    height: 36
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            icon_line.x = 213;

//                            if(musicQmlLoader.item === null){
//                                musicQmlLoader.active = true;
//                            }

//                            musicQmlLoader.active = true;

//                            musicQmlLoader.item.visible = true;
//                            musicQmlLoader.item.x = main_window.x + 393;
//                            musicQmlLoader.item.y = main_window.y + 40;

                            if (musicQmlLoader.item){
                                musicQmlLoader.item.visible = !musicQmlLoader.item.visible;
                                musicQmlLoader.item.x = main_window.x + 393;
                                musicQmlLoader.item.y = main_window.y + 40;
                            }

//                            musicQmlLoader.visible = true;
//                            musicQmlLoader.x = main_window.x + 393;
//                            musicQmlLoader.y = main_window.y + 40;
                        }
                    }
                }

                Image {
                    id: media_icon
                    fillMode: Image.PreserveAspectFit
//                    source: "HU_Assets/Icons/media.png"
                    source: clickNotifier.clicked ? "HU_Assets/light/Icons/media_l.png" : "HU_Assets/Icons/media.png"
                    width: 36
                    height: 36
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            icon_line.x = 285;

                            // media qml with usb
//                            mediaQmlLoader.active = true;
//                            mediaQmlLoader.item.visible = true;
//                            mediaQmlLoader.item.x = main_window.x + 393;
//                            mediaQmlLoader.item.y = main_window.y + 40;

                            // media qml with youtube
                            youtubeMediaQmlLoader.active = true;
//                            youtubeMediaQmlLoader.item.visible = true;
//                            youtubeMediaQmlLoader.item.x = main_window.x + 393;
//                            youtubeMediaQmlLoader.item.y = main_window.y + 40;
                            youtubeMediaQmlLoader.visible = true;
                            youtubeMediaQmlLoader.x = main_window.x + 393;
                            youtubeMediaQmlLoader.y = main_window.y + 40;
                        }
                    }
                }
            }
        }
    }

    Image {
        id: mirroring_icon
        x: 835
        y: 10
        fillMode: Image.PreserveAspectFit
        source: clickNotifier.clicked ? "HU_Assets/light/Icons/mirroring_icon_l.png" : "HU_Assets/Icons/mirroring_icon.png"
        MouseArea{
            anchors.fill: parent
            onClicked: {
//                mirrorQmlLoader.active = true;
//                mirrorQmlLoader.visible = true;

//                mirrorQmlLoader.item.visible = true;
                MirrorProvider.init()
            }
        }
    }

    Image {
           id: bluetooth_connected_image
           x: 810
           y: 15
           source: "/HU_Assets/Icons/charm_bluetooth.png"
           fillMode: Image.PreserveAspectFit
           visible: isBluetoothConnected
       }

       Connections {
           target: btManager
           onConnectedToDevice: {
               isBluetoothConnected = true;
           }
           onConnectionLost: {
               isBluetoothConnected = false;
           }
           onConnectionFailed: {
               isBluetoothConnected = false;
           }
       }

    /////////////////////////////////////////////////////////////////////// dynamic load pages
    Loader{
        id: pdcQmlLoader
        source: "pdc_page.qml"
        active: client.gear === 3
        visible: active
        onLoaded: {
            pdcQmlLoader.visible = false;
        }
    }

    Loader{
        id: settingQmlLoader
        source: "setting_page.qml"
        active: true
        visible: true
        onLoaded: {
//            settingQmlLoader.item.visible = false;
//            settingQmlLoader.visible = false;

            if(item){
                item.visible = false;
            }
        }
    }

    Loader{
        id: mapQmlLoader
        source: "map_page.qml"
        active: false
        visible: false
        onLoaded: {
//            mapQmlLoader.item.visible = false;
            mapQmlLoader.visible = false;
        }
//        onStatusChanged: {
//            if (status === Loader.Null){
//                mapQmlLoader.visible = false;
//            }
//        }
    }

    Loader{
        id: musicQmlLoader
        source: "music_page.qml"
//        active: false
        active: true
        visible: true
        onLoaded: {
//            musicQmlLoader.item.visible = false;

//            musicQmlLoader.visible = false;

            if(item){
                item.visible = false;
            }

//            musicQmlLoader.item.currentSong = main_window.currentSong;
//            musicQmlLoader.item.currentSinger = main_window.currentSinger;
//            musicQmlLoader.item.currentAlbumcover = main_window.currentAlbumcover;

//            musicQmlLoader.item.setProperty("currentSong", main_window.currentSong);
//            musicQmlLoader.item.setProperty("currentSinger", main_window.currentSinger);
//            musicQmlLoader.item.setProperty("currentAlbumcover", main_window.currentAlbumcover);
        }
    }

    Loader{
        id: mediaQmlLoader
        source: "media_page.qml"
        active: false
        visible: false
        onLoaded: {
//            mediaQmlLoader.item.visible = false;
            mediaQmlLoader.visible = false;
        }
    }

    Loader{
        id: youtubeMediaQmlLoader
        source: "media_page_youtube.qml"
        active: false
        visible: false
        onLoaded: {
//            youtubeMediaQmlLoader.item.visible = false;
            youtubeMediaQmlLoader.visible = false;
        }
    }

    Loader{
        id: mirrorQmlLoader
        source: "mirror_page.qml"
        active: false
        visible: false
        onLoaded: {
//            mirrorQmlLoader.item.visible = false;
            mirrorQmlLoader.visible = false;
        }
    }
}

/*##^##
Designer {
    D{i:66;invisible:true}
}
##^##*/
