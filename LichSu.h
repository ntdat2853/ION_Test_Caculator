#ifndef LICHSU_H
#define LICHSU_H

#include <QObject>
#include <QSqlDatabase>
#include <QString>

class LichSu : public QObject
{
    Q_OBJECT
public:
    explicit LichSu(QObject *parent = nullptr);
    ~LichSu();

    bool taoDB();//Tạo DB

    Q_INVOKABLE QStringList nhanLichSu();
    Q_INVOKABLE void xoaLichSu();
signals:
    void lichSuChanged();
public slots:
    void themLichSu(const QString &bieuThuc, const QString &ketQua);//thực hiện khi nhận signal tinhToanXong
private:
    QSqlDatabase m_db;
};

#endif // LICHSU_H
