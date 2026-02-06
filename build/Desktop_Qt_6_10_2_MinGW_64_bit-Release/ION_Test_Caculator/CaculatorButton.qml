import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Button {
    id: control
    property color bodyColor: "transparent"
    property color textColor: "black"
    property color hoverColor: "#f0f0f0"
    property int fontSize: 18
    property bool isIcon: false
    property bool hideBorder: bodyColor === "transparent"

    background: Rectangle {
        implicitHeight: 40
        implicitWidth: 40
        color: control.pressed ? "#dcdcdc" : (control.hovered ? control.hoverColor : control.bodyColor)
        radius: 4
        border.color: control.bodyColor.a > 0 ? "#e0e0e0" : "transparent"
        border.width: control.bodyColor.a > 0 ? 1 : 0
    }

    contentItem: Item {
        anchors.fill: parent
        Image {
            anchors.centerIn: parent
            source: control.isIcon ? control.text : ""
            width: 20
            height: 20
            fillMode: Image.PreserveAspectFit
            visible: control.isIcon
        }
        Text {
            anchors.centerIn: parent
            text: control.isIcon ? "" : control.text
            font.pixelSize: control.fontSize
            color: control.textColor
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            textFormat: Text.RichText
            visible: !control.isIcon
        }
    }
}
