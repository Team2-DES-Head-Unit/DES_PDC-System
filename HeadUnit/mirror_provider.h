#ifndef MIRRORPROVIDER_H
#define MIRRORPROVIDER_H

#include <QObject>
#include <QDebug>
#include <QProcess>
#include <QWindow>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QTimer>

class MirrorProvider : public QObject {
    Q_OBJECT

private:
    QProcess *scrcpyProcess;

public:
    explicit MirrorProvider(QObject *parent = nullptr) : QObject(parent) {
        scrcpyProcess = new QProcess(this);
    }

    ~MirrorProvider() {
        end();
    }

    Q_INVOKABLE void init() {
            // Start scrcpy and capture the output into a pipe
            scrcpyProcess->setProgram("scrcpy");
            scrcpyProcess->setArguments(QStringList() << "-f");
            scrcpyProcess->start();
    }

    Q_INVOKABLE void end() {
        scrcpyProcess->kill();
        scrcpyProcess->waitForFinished();
    }
};

#endif // MIRRORPROVIDER_H
