import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls

Window {
    id: window
    width: 400
    height: 600
    minimumWidth: 350
    minimumHeight: 500
    visible: true
    title: "Calculator"
    color: "#f3f3f3"

    readonly property bool isWide: width > 600

    RowLayout {
        anchors.fill: parent
        spacing: 0

        //Máy tính
        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0

            RowLayout {
                Layout.fillWidth: true
                Layout.preferredHeight: 50
                anchors.leftMargin: 10
                anchors.rightMargin: 10

                //Nút Menu
                CaculatorButton {
                    isIcon: true
                    text: "assets/icons/menu.png"
                    Layout.preferredWidth: 40
                    Layout.preferredHeight: 40
                }
                Text {
                    text: "Standard"
                    font.pixelSize: 20
                    font.bold: true
                    Layout.leftMargin: 15
                }
                //Nút popup
                CaculatorButton {
                    isIcon: true
                    text: "assets/icons/window.png"
                    Layout.preferredWidth: 30
                    Layout.preferredHeight: 30
                }
                Item {
                    Layout.fillWidth: true
                }
                //Nút lịch sử
                CaculatorButton {
                    visible: !isWide
                    isIcon: true
                    text: "assets/icons/history.png"
                    Layout.preferredWidth: 40
                    Layout.preferredHeight: 40
                    onClicked: historyDrawer.open()
                }
            }

            //Màn hình
            ColumnLayout {
                Layout.fillWidth: true
                Layout.preferredHeight: 120
                Layout.rightMargin: 15
                spacing: 0

                // Dòng biểu thức
                Text {
                    Layout.fillWidth: true
                    text: tinhToan.bieuThuc
                    horizontalAlignment: Text.AlignRight
                    color: "#666"
                    font.pixelSize: 16
                }

                // Dòng số nhập vào
                Text {
                    Layout.fillWidth: true
                    text: tinhToan.so
                    horizontalAlignment: Text.AlignRight
                    font.pixelSize: 56
                    font.bold: true
                    fontSizeMode: Text.Fit
                    minimumPixelSize: 24
                }
            }
            // Các nút M
            RowLayout {
                Layout.fillWidth: true
                Layout.maximumWidth: 450
                Layout.preferredHeight: 40
                Layout.alignment: Qt.AlignLeft
                Layout.leftMargin: 5
                spacing: 0

                Repeater {
                    model: ["MC", "MR", "M+", "M-", "MS", "M <font size='1'>▼</font>"]

                    CaculatorButton {
                        text: modelData
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        bodyColor: "transparent"
                        fontSize: 12
                        visible: (index === 5) ? !window.isWide : true
                        Layout.preferredWidth: visible ? 1 : 0
                    }
                }
            }
            //Phần nút 6x4
            GridLayout {
                columns: 4
                Layout.fillWidth: true
                Layout.fillHeight: true
                rowSpacing: 2
                columnSpacing: 2
                CaculatorButton {
                    text: "%"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    bodyColor: "#f9f9f9"
                }
                CaculatorButton {
                    text: "CE"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    bodyColor: "#f9f9f9"
                    onClicked: tinhToan.cE()
                }
                CaculatorButton {
                    text: "C"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    bodyColor: "#f9f9f9"
                    onClicked: tinhToan.clear()
                }
                CaculatorButton {
                    text: "⌫"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    bodyColor: "#f9f9f9"
                    onClicked: tinhToan.xoa()
                }
                CaculatorButton {
                    text: "<sup>1</sup>/<sub>x</sub>"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    bodyColor: "#f9f9f9"
                }
                CaculatorButton {
                    text: "x<sup>2</sup>"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    bodyColor: "#f9f9f9"
                }
                CaculatorButton {
                    text: "<sup>2</sup>√x"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    bodyColor: "#f9f9f9"
                }
                CaculatorButton {
                    text: "÷"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    bodyColor: "#f9f9f9"
                    onClicked: tinhToan.nhapPhepTinh("/")
                }
                CaculatorButton {
                    text: "7"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    bodyColor: "#f9f9f9"
                    onClicked: tinhToan.nhapSo(7)
                }
                CaculatorButton {
                    text: "8"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    bodyColor: "#f9f9f9"
                    onClicked: tinhToan.nhapSo(8)
                }
                CaculatorButton {
                    text: "9"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    bodyColor: "#f9f9f9"
                    onClicked: tinhToan.nhapSo(9)
                }
                CaculatorButton {
                    text: "×"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    bodyColor: "#f9f9f9"
                    onClicked: tinhToan.nhapPhepTinh("*")
                }
                CaculatorButton {
                    text: "4"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    bodyColor: "#f9f9f9"
                    onClicked: tinhToan.nhapSo(4)
                }
                CaculatorButton {
                    text: "5"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    bodyColor: "#f9f9f9"
                    onClicked: tinhToan.nhapSo(5)
                }
                CaculatorButton {
                    text: "6"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    bodyColor: "#f9f9f9"
                    onClicked: tinhToan.nhapSo(6)
                }
                CaculatorButton {
                    text: "-"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    bodyColor: "#f9f9f9"
                    onClicked: tinhToan.nhapPhepTinh("-")
                }
                CaculatorButton {
                    text: "1"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    bodyColor: "#f9f9f9"
                    onClicked: tinhToan.nhapSo(1)
                }
                CaculatorButton {
                    text: "2"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    bodyColor: "#f9f9f9"
                    onClicked: tinhToan.nhapSo(2)
                }
                CaculatorButton {
                    text: "3"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    bodyColor: "#f9f9f9"
                    onClicked: tinhToan.nhapSo(3)
                }
                CaculatorButton {
                    text: "+"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    bodyColor: "#f9f9f9"
                    onClicked: tinhToan.nhapPhepTinh("+")
                }
                CaculatorButton {
                    text: "+/-"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    bodyColor: "#f9f9f9"
                    onClicked: tinhToan.daoDau()
                }
                CaculatorButton {
                    text: "0"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    bodyColor: "#f9f9f9"
                    onClicked: tinhToan.nhapSo(0)
                }
                CaculatorButton {
                    text: "."
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    bodyColor: "#f9f9f9"
                }
                CaculatorButton {
                    text: "="
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    bodyColor: "#85005c"
                    hoverColor: "#A13194"
                    textColor: "white"
                    fontSize: 24
                    onClicked: tinhToan.tinhToan()
                }
            }
        }

        //Tab lịch sử
        Rectangle {
            id: historyPanel
            visible: isWide
            Layout.preferredWidth: isWide ? 300 : 0
            Layout.fillHeight: true
            color: "#f3f3f3"

            HistoryPanel {
                anchors.fill: parent
            }
        }
        Drawer {
            id: historyDrawer
            width: parent.width
            height: parent.height * 0.6
            edge: Qt.BottomEdge
            interactive: true
            HistoryPanel {
                anchors.fill: parent
            }
        }
    }
}
