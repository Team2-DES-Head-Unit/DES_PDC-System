cmake_minimum_required(VERSION 3.5)

project(HeadUnit LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
#set(CMAKE_PREFIX_PATH "/usr/local/lib/cmake/vsomeip")

# QtCreator supports the following variables for Android, which are identical to qmake Android variables.
# Check http://doc.qt.io/qt-5/deployment-android.html for more information.
# They need to be set before the find_package(Qt5 ...) call.

#if(ANDROID)
#    set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android")
#    if (ANDROID_ABI STREQUAL "armeabi-v7a")
#        set(ANDROID_EXTRA_LIBS
#            ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libcrypto.so
#            ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libssl.so)
#    endif()
#endif()

find_package(Qt5 COMPONENTS Core Quick WebEngine Multimedia Bluetooth REQUIRED)
find_package(Qt5 COMPONENTS Core Gui REQUIRED)

set(CMAKE_PREFIX_PATH "/usr/local/lib/cmake/vsomeip")
find_package(vsomeip3 REQUIRED)
#find_package(Wayland REQUIRED)

if(ANDROID)
    add_library(HeadUnit SHARED
      main.cpp
      basic_func.h
      weather_provider.h
      music_player.h
      youtube_player.h
      bluetoothmanager.h
      client.h
      receiver.h
      mirror_provider.h
      clicknotier.h

      basic_func.cpp
      bluetoothmanager.cpp
      client.cpp
      receiver.cpp

      qml.qrc
      media_contents.qrc
    )
else()
    add_executable(HeadUnit
      main.cpp
      basic_func.h
      weather_provider.h
      music_player.h
      youtube_player.h
      bluetoothmanager.h
      client.h
      receiver.h
      mirror_provider.h
      clicknotier.h

      basic_func.cpp
      bluetoothmanager.cpp
      client.cpp
      receiver.cpp

      qml.qrc
      media_contents.qrc
    )
endif()

target_compile_definitions(HeadUnit
  PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(HeadUnit
  PRIVATE Qt5::Core Qt5::Quick Qt5::WebEngine Qt5::Multimedia Qt5::Bluetooth vsomeip3 pthread)
