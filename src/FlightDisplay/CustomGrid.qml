import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtQuick.Layouts

import QGroundControl.ScreenTools
import QGroundControl.Palette

Rectangle {
    id: root

    anchors {
        left: parent.left
        leftMargin: 8
        bottom: parent.bottom
        bottomMargin: 8
    }

    width: childrenRect.width
    height: childrenRect.height
    radius: ScreenTools.defaultFontPixelWidth / 2
    color: qgcPal.toolbarBackground

    readonly property var numberList: [
        "Zeroth",
        "First",
        "Second",
        "Third",
        "Fourth",
        "Fifth",
        "Sixth",
        "Seventh",
        "Eighth"
    ]

    ColumnLayout {
        spacing: 0
        Label {
            id: label
            text: "Click a button"
            color: qgcPal.text
            font.family:    ScreenTools.normalFontFamily
            font.pixelSize: 20
            Layout.alignment: Qt.AlignHCenter
        }

        RowLayout {
            Layout.margins: 8
            spacing: 4
            Repeater {
                model: 3
                ColumnLayout {
                    spacing: 4
                    property int columnIndex: model.index
                    Repeater {
                        model: 3
                        Button {
                            property int rowIndex: model.index
                            text: rowIndex * 3 + columnIndex
                            Layout.preferredWidth: 100
                            Layout.preferredHeight: 100

                            onClicked: {
                                label.text = numberList[rowIndex * 3 + columnIndex] + " button clicked"
                            }
                        }
                    }
                }
            }
        }
    }
}
