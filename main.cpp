#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>
#include <QDebug>
#include <QQmlContext>

#include "LichSu.h"
#include "TinhToan.h"

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    //MyCode Start

    app.setWindowIcon(QIcon(":/qt/qml/ION_Test_Caculator/assets/icons/logo_caculator.png"));

    LichSu lsu;
    TinhToan ttoan;

    if(!lsu.taoDB()) {
        qWarning() << "Ko tao dc";
    }

    //Kết nối TinhToan và LichSu
    //Khi tính xong thì thêm vào lịch sử
    QObject::connect(&ttoan, &TinhToan::tinhToanXong, &lsu, &LichSu::themLichSu);

    //Kết nối QML
    engine.rootContext()->setContextProperty("lichSu", &lsu);
    engine.rootContext()->setContextProperty("tinhToan", &ttoan);
    //End

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("ION_Test_Caculator", "Main");

    return app.exec();
}
