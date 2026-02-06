#ifndef TINHTOAN_H
#define TINHTOAN_H

#include <QObject>

class TinhToan : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString so READ so NOTIFY soChanged);//số hiển thị ở dưới báo số nhập vào
    Q_PROPERTY(QString bieuThuc READ bieuThuc NOTIFY bieuThucChanged)//hiện biểu thức ở phần tr
public:
    explicit TinhToan(QObject *parent = nullptr);

    QString so() const;
    QString bieuThuc() const;

    Q_INVOKABLE void nhapSo(int so);
    Q_INVOKABLE void nhapPhepTinh(const QString &phepTinh);
    Q_INVOKABLE void tinhToan();
    Q_INVOKABLE void xoa();
    Q_INVOKABLE void clear();
    Q_INVOKABLE void cE();
    Q_INVOKABLE void daoDau();

signals:
    void soChanged();
    void bieuThucChanged();

    void tinhToanXong(const QString &bieuThuc, const QString &ketqua);

private:
    QString m_so = "0";
    QString m_bieuThuc;
    int m_toanTu = 0;//Số để thực hiện phép tính
    QString m_phepTinh = "";//Phép tính
    bool m_isDoiSo = true;//có đang đợi số không

    long long thucHienPhepTinh(int s1, int s2, const QString &pt);//truyền số 1, số 2 và phép tính để thực hiện phép tính giữa số 1 và số 2
};

#endif // TINHTOAN_H
