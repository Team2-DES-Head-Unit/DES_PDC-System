#ifndef CLICKNOTIER_H
#define CLICKNOTIER_H

#include <QObject>

class ClickNotifier : public QObject {
    Q_OBJECT
    Q_PROPERTY(bool clicked READ clicked WRITE setClicked NOTIFY clickedChanged)

public:
    explicit ClickNotifier(QObject *parent = nullptr) : QObject(parent), m_clicked(false) {}

    bool clicked() const { return m_clicked; }

    void setClicked(bool clicked) {
        if (m_clicked != clicked) {
            m_clicked = clicked;
            emit clickedChanged(); // clicked가 바뀔 때마다 신호 발생
        }
    }

signals:
    void clickedChanged();

public slots:
    void setTrue() {
        setClicked(true);
    }

    void setFalse() {
        setClicked(false);
    }

private:
    bool m_clicked;
};

#endif // CLICKNOTIER_H
