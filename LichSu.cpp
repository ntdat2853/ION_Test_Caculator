#include "LichSu.h"
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>
#include <QCoreApplication>


LichSu::LichSu(QObject *parent)
    : QObject{parent}
{}

LichSu::~LichSu()
{
    if(m_db.isOpen()) m_db.close();
}

bool LichSu::taoDB()
{
    m_db = QSqlDatabase::addDatabase("QSQLITE");
    QString dbPath = QCoreApplication::applicationDirPath() + "/LichSu_TinhToan.db";
    m_db.setDatabaseName(dbPath);

    if(!m_db.open()) {
        qDebug() << "Loi DB" << m_db.lastError().text();
        return false;
    }

    QSqlQuery query;
    return query.exec("CREATE TABLE IF NOT EXISTS lichsu ("
                      "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                      "bieuthuc TEXT, "
                      "ketqua TEXT, "
                      "thoigian DATETIME DEFAULT CURRENT_TIMESTAMP)");
}

QStringList LichSu::nhanLichSu()
{
    QStringList list;
    QSqlQuery query("SELECT bieuthuc, ketqua FROM lichsu ORDER BY thoigian DESC LIMIT 20");
    while (query.next()) {
        list << (query.value(0).toString() + " = " + query.value(1).toString());
    }
    return list;
}

void LichSu::xoaLichSu()
{
    QSqlQuery query;
    query.exec("DELETE FROM lichsu");
    emit lichSuChanged();
}

void LichSu::themLichSu(const QString &bieuThuc, const QString &ketQua)
{
    QSqlQuery query;
    query.prepare("INSERT INTO lichsu (bieuthuc, ketqua) VALUES (:bt, :kq)");
    query.bindValue(":bt", bieuThuc);
    query.bindValue(":kq", ketQua);

    query.exec();
    emit lichSuChanged();
}
