#include <QCamera>
#include <QCameraInfo>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[]) {
    QCoreApplication app(argc, argv);

    QCamera *camera = new QCamera(QCameraInfo::availableCameras().first());
    camera->start(); // 카메라 시작

    return app.exec();
}
