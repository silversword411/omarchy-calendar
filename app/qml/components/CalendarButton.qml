import QtQuick
import QtQuick.Controls
import QtQuick.Controls.impl

Button {
    id: control
    property bool selected: false
    property bool outlined: false
    property color accentColor: theme.accent
    property string accessibleName: text
    property string accessibleDescription: ""

    Accessible.name: accessibleName
    Accessible.description: accessibleDescription

    implicitHeight: Math.round(36 * (preferences.interfaceDensity === "compact" ? 0.86 : 1))
    padding: 0
    leftPadding: preferences.interfaceDensity === "compact" ? 9 : 12
    rightPadding: preferences.interfaceDensity === "compact" ? 9 : 12
    hoverEnabled: true

    icon.width: 16
    icon.height: 16
    icon.color: control.selected ? theme.foreground : theme.foregroundMuted
    spacing: 10

    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        icon: control.icon
        text: control.text
        font.pixelSize: theme.baseFontSize
        font.weight: control.selected ? Font.DemiBold : Font.Medium
        color: control.selected ? theme.foreground : theme.foregroundMuted
    }

    background: Rectangle {
        radius: preferences.interfaceDensity === "compact" ? theme.controlRadius - 2 : theme.controlRadius
        color: control.down
               ? Qt.rgba(control.accentColor.r, control.accentColor.g, control.accentColor.b, 0.24)
                 : control.selected
                 ? Qt.rgba(control.accentColor.r, control.accentColor.g, control.accentColor.b, 0.17)
                 : control.outlined
                   ? Qt.rgba(theme.foreground.r, theme.foreground.g, theme.foreground.b, 0.035)
                 : control.hovered
                   ? Qt.rgba(theme.foreground.r, theme.foreground.g, theme.foreground.b, 0.07)
                   : "transparent"
        border.width: control.activeFocus || control.outlined ? 1 : 0
        border.color: control.activeFocus ? theme.accent
                     : Qt.rgba(theme.foreground.r, theme.foreground.g, theme.foreground.b, 0.13)

        Behavior on color { ColorAnimation { duration: 110 } }
    }
}
