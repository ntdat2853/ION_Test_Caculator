import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
    id: root
    color: "#f3f3f3"

    ListModel {
        id: historyModel
    }

    function updateHistory() {
        let newData = lichSu.nhanLichSu()
        if (newData.length > 0) {
            if (historyModel.count === 0) {
                for (var i = 0; i < newData.length; i++) {
                    historyModel.append({
                                            "content": newData[i]
                                        })
                }
            } else if (newData[0] !== historyModel.get(0).content) {
                historyModel.insert(0, {
                                        "content": newData[0]
                                    })
                if (historyModel.count > 20) {
                    historyModel.remove(historyModel.count - 1)
                }
            }
        } else {
            historyModel.clear()
        }
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        RowLayout {
            Layout.fillWidth: true
            Layout.preferredHeight: 50
            Layout.leftMargin: 15
            spacing: 20
            Column {
                Layout.alignment: Qt.AlignVCenter
                Text {
                    text: "History"
                    font.bold: true
                    font.pixelSize: 14
                }
                Rectangle {
                    width: parent.width
                    height: 3
                    color: "#85005c"
                }
            }
            Text {
                text: "Memory"
                font.bold: true
                font.pixelSize: 14
                color: "#666"
                Layout.alignment: Qt.AlignVCenter
            }
            Item {
                Layout.fillWidth: true
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            Text {
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 15
                text: "There's no history yet."
                visible: historyModel.count === 0
            }

            ListView {
                id: historyView
                anchors.fill: parent
                model: historyModel
                spacing: 15
                clip: true

                delegate: Item {
                    width: historyView.width
                    height: contentCol.implicitHeight + 20

                    Column {
                        id: contentCol
                        width: parent.width - 30
                        anchors.centerIn: parent
                        spacing: 4

                        Text {
                            width: parent.width
                            text: model.content.includes(
                                      "=") ? model.content.split(
                                                 "=")[0] + " =" : model.content
                            horizontalAlignment: Text.AlignRight
                            color: "#666"
                            font.pixelSize: 13
                        }
                        Text {
                            width: parent.width
                            text: model.content.includes(
                                      "=") ? model.content.split("=")[1] : ""
                            horizontalAlignment: Text.AlignRight
                            font.bold: true
                            font.pixelSize: 24
                        }
                    }
                }

                Component.onCompleted: updateHistory()

                Connections {
                    target: lichSu
                    function onLichSuChanged() {
                        updateHistory()
                    }
                }
            }

            CaculatorButton {
                isIcon: true
                text: "assets/icons/bin.png"
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.margins: 15
                visible: historyModel.count > 0
                onClicked: {
                    lichSu.xoaLichSu()
                    historyModel.clear()
                }
            }
        }
    }
}
