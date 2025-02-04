import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import QtMultimedia 5.12
import QtQuick.Layouts 1.12
import QtWebEngine 1.0
import youtubePlayer 1.0

Rectangle{
    id: media_window
    visible: true
    width: 618
    height: 480
    color: "transparent"
//    flags: Qt.FramelessWindowHint

    Component.onCompleted: {
        youtube_quit.visible = false;
    }

//    onActiveFocusItemChanged: {
//        if(!activeFocusItem){
//            visible = false;
//            icon_line.x = 138;
//        }
//    }

    YoutubePlayer{
        id: youtubeFetcher
        onVideoFetched: {
            youtubeListModel.clear();
            for (var i = 1; i < items.length; i++) {
                youtubeListModel.append({
                    thumbnail: items[i].snippet.thumbnails.high.url,
                    title: items[i].snippet.title,
                    channel: items[i].snippet.channelTitle,
                    videoId: items[i].id
                });
            }
        }
    }

    Image {
        id: base_window
        fillMode: Image.PreserveAspectFit
        anchors.fill: parent
//        source: "HU_Assets/Background/basic_window.png"
        source: clickNotifier.clicked ? "HU_Assets/light/Background/basic_window_l.png" : "HU_Assets/Background/basic_window.png"

        Image {
            id: window_close_button
            x: 552
            y: 28
            width: 35
            height: 35
            fillMode: Image.PreserveAspectFit
//            source: "HU_Assets/Icons/close_icon.png"
            source: clickNotifier.clicked ? "HU_Assets/light/Icons/close_icon_l.png" : "HU_Assets/Icons/close_icon.png"

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    media_window.visible = false;
                    icon_line.x = 138;

                    webView.runJavaScript("document.querySelector('iframe').contentWindow.postMessage('{\"event\":\"command\",\"func\":\"stopVideo\",\"args\":\"\"}', '*');");

                    webView.url = "";
                    webView.reload();

                    webView.visible = false;
                    youtubeMediaQmlLoader.active = false;
                }
            }
        }

        Rectangle {
            id: youtube
            x: 39
            y: 30
            width: 164
            height: 30
            color: "transparent"

            Image {
                id: youtube_icon
                width: 28
                anchors.verticalCenterOffset: 1
                anchors.leftMargin: -1
//                source: "HU_Assets/Components/Video/youtube_icon.png"
                source: clickNotifier.clicked ? "HU_Assets/light/Components/Video/youtube_icon_l.png" : "HU_Assets/Components/Video/youtube_icon.png"
                fillMode: Image.PreserveAspectFit
                anchors{
                    verticalCenter: youtube.verticalCenter
                    left: youtube.left
                }
            }
            Text {
                id: youtube_text
                x: 33
                width: 192
                height: 30
                text: qsTr("YouTube Trending")
                anchors.verticalCenterOffset: 1
                anchors.bottomMargin: -1
                anchors.rightMargin: -61
                font.pixelSize: 23
//                color: "#ffffff"
                color: clickNotifier.clicked ? "#414141" : "#ffffff"
                anchors{
                    verticalCenter: youtube.verticalCenter
                    right: youtube.right
                    bottom: youtube.bottom
                }
            }


        }

        Rectangle {
            id: base_line
            x: 42
            y: 76
            width: 545
            height: 2
            color: "#424343"
        }


        Rectangle{
            id: youtube_track
            x: 42
            y: 90
            width: 545
            height: 370
            color: "transparent"

            ListView{
                id: youtubeListView
                width: youtube_track.width
                height: youtube_track.height
                clip: true
                model: youtubeListModel

                delegate: ItemDelegate{
                    id: youtubelist_item
                    width: youtubeListView.width
                    height: 125

                    Image {
                        id: thumbnailImage
                        source: model.thumbnail
                        width: 200
                        height: 120
                        anchors.verticalCenter: youtubelist_item.verticalCenter
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                webView.visible = true;
                                webView.url = "https://www.youtube.com/embed/" + model.videoId + "?autoplay=1";
                                youtube_quit.visible = true;
                            }
                        }
                    }

                    Text {
                        id: youtube_title
                        text: model.title
//                        color: "#ffffff"
                        color: clickNotifier.clicked ? "#414141" : "#ffffff"
                        font.pixelSize: 16
                        font.bold: true
                        anchors{
                            left: thumbnailImage.right
                            leftMargin: 20
                            top: youtubelist_item.top
                            topMargin: 15
                        }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                webView.visible = true;
                                webView.url = "https://www.youtube.com/embed/" + model.videoId + "?autoplay=1";
                                youtube_quit.visible = true;
                            }
                        }
                    }

                    Text {
                        id: youtube_channel
                        text: model.channel
//                        color: "#ffffff"
                        color: clickNotifier.clicked ? "#414141" : "#ffffff"
                        font.pixelSize: 12
                        font.italic: true
                        anchors{
                            left: thumbnailImage.right
                            leftMargin: 20
                            top: youtube_title.bottom
                            topMargin: 10
                        }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                webView.visible = true;
                                webView.url = "https://www.youtube.com/embed/" + model.videoId + "?autoplay=1";
                                youtube_quit.visible = true;
                            }
                        }
                    }
                }
            }
        }

    } // base_window

    WebEngineView {
        id: webView
        x: youtube_track.x
        y: youtube_track.y
        width: youtube_track.width
        height: youtube_track.height
        url: ""
        visible: false
    }

    Image {
        id: youtube_quit
        x: 467
        y: 34
//        source: "HU_Assets/Components/Video/back_icon.png"
        source: clickNotifier.clicked ? "HU_Assets/light/Components/Video/back_icon_l.png" : "HU_Assets/Components/Video/back_icon.png"
        width: 26
        height: 26
        MouseArea {
            width: 30
            height: 30
            anchors.fill: youtube_quit
            onClicked: {
                webView.runJavaScript("document.querySelector('iframe').contentWindow.postMessage('{\"event\":\"command\",\"func\":\"stopVideo\",\"args\":\"\"}', '*');");
                webView.url = "";
                webView.reload();
                youtubeListView.visible = true;
                webView.visible = false;
                youtube_quit.visible = false;
//                youtubeMediaQmlLoader.active = false;
            }
        }
    }

    Image {
        id: reset_list
        x: 510
        y: 35
//        source: "HU_Assets/Components/Video/reset_list_icon.png"
        source: clickNotifier.clicked ? "HU_Assets/light/Components/Video/reset_list_icon_l.png" : "HU_Assets/Components/Video/reset_list_icon.png"
        fillMode: Image.PreserveAspectFit
        MouseArea{
            width: 30
            height: 30
            anchors.fill: parent
            onClicked: {
                youtubePlayerProvider.fetchVideo();
            }
        }
    }

    ListModel {
        id: youtubeListModel
    }
}




