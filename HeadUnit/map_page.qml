import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtLocation 5.12
import QtPositioning 5.12

Rectangle{
    id: map_window
    visible: true
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

    Rectangle {
        id: base_window
        anchors.fill: parent
        radius: 15

        Map {
            anchors.fill: base_window
            zoomLevel: 15

            plugin: Plugin{
                name: "osm"
                PluginParameter{
                    name: "osm.mapping.providersrepository.address"
                    value: "https://tile.thunderforest.com/cycle/{z}/{x}/{y}.png?apikey=adf1b85f20044f738f928e712b208a46"
                }
                PluginParameter { name: "osm.mapping.highdpi_tiles"; value: true }
            }

            // check the list of map types
//            Component.onCompleted: {
//                for (var i=0; i<supportedMapTypes.legnth; i++){
//                    console.log("Map type " + i + ": " + supportedMapTypes[i].name + " - " + supportedMapTypes[i].description)
//                }
//            }

            center: QtPositioning.coordinate(52.42496895298135, 10.791952483241028) // SEA:ME Lab coordinate
            activeMapType: supportedMapTypes[0] // use "Cycle" map type
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

        MouseArea{
            anchors.fill: parent
            onClicked: {
                map_window.visible = false;
                mapQmlLoader.active = false;
                icon_line.x = 138;
            }
        }
    }
}
