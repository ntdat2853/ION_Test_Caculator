#include "TinhToan.h"

#include <qdebug>

TinhToan::TinhToan(QObject *parent)
    : QObject{parent}
{}

QString TinhToan::so() const
{
    return m_so;
}

QString TinhToan::bieuThuc() const
{
    return m_bieuThuc;
}

void TinhToan::nhapSo(int so)
{
    if(m_isDoiSo) {
        if(m_phepTinh.isEmpty()) {
            m_bieuThuc = "";
            emit bieuThucChanged();
        }
        m_so = QString::number(so);
        m_isDoiSo = false;
    } else {
        if(m_so == "0") m_so = QString::number(so);
        else m_so += QString::number(so);
    }

    emit soChanged();
}

void TinhToan::nhapPhepTinh(const QString &phepTinh)
{
    int ketQuaHienTai = m_so.toInt();

    if(!m_phepTinh.isEmpty() && !m_isDoiSo) {
        int ketQua = thucHienPhepTinh(m_toanTu, ketQuaHienTai, m_phepTinh);
        emit tinhToanXong(QString::number(m_toanTu) + " " + m_phepTinh + " " + QString::number(ketQuaHienTai), QString::number(ketQua));

        m_toanTu = ketQua;
        m_so = QString::number(ketQua);
        m_phepTinh = phepTinh;
        emit soChanged();
    } else {
        m_toanTu = ketQuaHienTai;
    }

    m_phepTinh = phepTinh;
    m_isDoiSo = true;
    m_bieuThuc = QString::number(m_toanTu) + " " + phepTinh;
    emit bieuThucChanged();
}

void TinhToan::tinhToan()
{
    if(m_phepTinh.isEmpty()) {
        m_bieuThuc = QString::number(m_toanTu) + " =";
        emit tinhToanXong(m_bieuThuc,QString::number(m_toanTu));
        return;
    }

    int ketQuaHienTai = m_so.toInt();

    int ketQua = thucHienPhepTinh(m_toanTu, ketQuaHienTai, m_phepTinh);
    m_bieuThuc = QString::number(m_toanTu) + " " + m_phepTinh + " " + QString::number(ketQuaHienTai) + " =";

    emit bieuThucChanged();
    emit tinhToanXong(m_bieuThuc.chopped(2), QString::number(ketQua));

    m_so = QString::number(ketQua);
    m_toanTu = ketQua;
    m_phepTinh = "";
    m_isDoiSo = true;
    emit soChanged();
}

void TinhToan::xoa()
{
    if(m_isDoiSo) return;
    if(m_so.length() > 1) {
        m_so.chop(1);
    } else {
        m_so = "0";
    }

    emit soChanged();
}

void TinhToan::clear()
{
    m_so = "0";
    m_bieuThuc = "";
    m_toanTu = 0;
    m_phepTinh = "";
    m_isDoiSo = true;

    emit soChanged();
    emit bieuThucChanged();
}

void TinhToan::cE()
{
    m_so = "0";

    emit soChanged();
}

void TinhToan::daoDau()
{
    if (m_so == "0") return;

    if (m_so.startsWith("-")) {
        m_so.remove(0, 1);
    } else {
        m_so.prepend("-");
    }

    emit soChanged();
}

long long TinhToan::thucHienPhepTinh(int s1, int s2, const QString &pt)
{
    if(pt == "+") return s1 + s2;
    if(pt == "-") return s1 - s2;
    if(pt == "*") return s1 * s2;
    if(pt == "/" && s2 != 0) return s1 / s2;

    return s2;
}
