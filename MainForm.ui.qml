import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4

Item {
    id: main
    width: 1024
    height: 768

    property alias exit: button3
    property alias save: button4
    property alias cancel: cancelButton
    property alias play: mouseArea1
    property alias playImage: button5
    property alias stateText: stateText
    property alias userList: textArea1
    property alias prizeList: listView1
    property alias stopAnim: stopAnim
    property bool playing: false
    property int num: 0
    property int i: -1
    property var users: []

    Image {
        id: container
        anchors.fill: parent
        source: "bk.png"
        Text {
            color: "#eeffffff"
            style: Text.Outline
            font.pointSize: 18
            font.bold: true
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: 8
            antialiasing: true
            horizontalAlignment: Text.AlignRight
            text: qsTr("Beijing Normal University CIST\nxuhongxu.cn")
        }

        Item {
            id: normal
            anchors.fill: parent
            z: 2

            Text {
                id: text1
                color: "#ffffff"
                anchors.verticalCenterOffset: -60
                anchors.centerIn: parent
                text: qsTr("PRIZE Draw!")
                style: Text.Outline
                font.pointSize: 40
                font.family: "Verdana"
                rotation: -10
                antialiasing: true

                SequentialAnimation on rotation {
                    id: rotAnim
                    // Animations on properties start running by default
                    running: true
                    loops: Animation.Infinite // The animation is set to loop indefinitely
                    NumberAnimation { from: -10; to: 10; duration: 800; easing.type: Easing.InOutQuad }
                    NumberAnimation { from: 10; to: -10; duration: 800; easing.type: Easing.InOutQuad }
                }
            }

            ColumnLayout {
                id: columnLayout1
                width: 160
                anchors.verticalCenterOffset: 60
                anchors.centerIn: parent

                Button {
                    id: button1
                    Layout.fillWidth: true
                    Layout.minimumHeight: 48
                    text: qsTr("Start")
                    onClicked: main.state = "prize";
                }

                Button {
                    id: button2
                    Layout.fillWidth: true
                    Layout.minimumHeight: 48
                    height: 48
                    text: qsTr("Settings")
                    onClicked: main.state = 'settings';
                }

                Button {
                    id: button3
                    Layout.fillWidth: true
                    Layout.minimumHeight: 48
                    text: qsTr("Exit")
                }

            }
        }

        ColumnLayout {
            id: settings
            anchors.fill: parent
            scale: 0
            z: 1
            anchors.margins: 10

            Text {
                id: text2
                color: "#ffffff"
                Layout.fillWidth: true
                text: qsTr("Name List:")
                style: Text.Outline
                font.pointSize: 20
                font.family: "Verdana"
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "#88ffffff"
                TextArea {
                    id: textArea1
                    antialiasing: true
                    anchors.fill: parent
                    backgroundVisible: false
                }
            }

            RowLayout {
                id: rowLayout1
                Layout.fillWidth: true

                Button {
                    id: button4
                    text: "Save"
                    isDefault: true
                }

                Button {
                    id: cancelButton
                    text: "Cancel"
                    onClicked: main.state = 'normal';
                }
            }

        }

        GridLayout {
            id: prize
            anchors.fill: parent
            scale: 0
            z: 0
            columns: 2
            rows: 2
            flow: GridLayout.LeftToRight

            Rectangle {
                Layout.rowSpan: 2
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "#aaffffff"

                ListView {
                    id: listView1
                    anchors.fill: parent
                    delegate: Item {
                        x: 5
                        width: 80
                        height: 44
                        Row {
                            id: row1
                            spacing: 10
                            Rectangle {
                                width: 40
                                height: 40
                                color: "#88ffffbb"
                                Text {
                                    color: "#ffffff"
                                    anchors.centerIn: parent
                                    text: num
                                    style: Text.Outline
                                    font.pointSize: 20
                                }
                            }

                            Text {
                                text: name
                                anchors.verticalCenter: parent.verticalCenter
                                font.bold: true
                            }
                        }
                    }
                    add: Transition {
                        NumberAnimation { properties: "x,y"; from: 100; duration: 600 }
                    }
                    model: ListModel {
                    }
                }
            }

            Text {
                id: stateText
                Layout.alignment: Qt.AlignCenter
                Layout.minimumWidth: 450
                horizontalAlignment: Text.AlignHCenter
                color: "#ffffff"
                style: Text.Outline
                font.pointSize: 80
                font.family: "Verdana"
                text: qsTr("Who?")
                antialiasing: true
                SequentialAnimation on scale {
                    running: false;
                    loops: 1;
                    id: stopAnim;
                    PropertyAction { target: seqAnim; property: "running"; value: false }
                    PropertyAction { target: stateText; property: "transformOrigin"; value: Item.Right }
                    NumberAnimation { to: 2.4; duration: 800; easing.type: Easing.InOutQuad }
                    PauseAnimation { duration: 500 }
                    NumberAnimation { to: 0.7; duration: 800; easing.type: Easing.InOutQuad }
                    PropertyAction { target: stateText; property: "transformOrigin"; value: Item.Center }
                    PropertyAction { target: seqAnim; property: "running"; value: true }
                }

                SequentialAnimation on scale {
                    id: seqAnim
                    // Animations on properties start running by default
                    running: true
                    loops: Animation.Infinite // The animation is set to loop indefinitely
                    NumberAnimation { to: 0.7; duration: 800; easing.type: Easing.InOutQuad }
                    NumberAnimation { to: 1; duration: 800; easing.type: Easing.InOutQuad }
                }
                SequentialAnimation on rotation {
                    id: rotAnim3
                    // Animations on properties start running by default
                    running: true
                    loops: Animation.Infinite // The animation is set to loop indefinitely
                    NumberAnimation { to: 4; duration: 600; easing.type: Easing.InOutQuad }
                    NumberAnimation { to: -4; duration: 600; easing.type: Easing.InOutQuad }
                }
            }

            ColumnLayout {
                Layout.alignment: Qt.AlignCenter
                Image {
                    id: button5
                    width: 128
                    height: 128
                    Layout.alignment: Qt.AlignCenter
                    source: "play.png"
                    sourceSize.height: 128
                    sourceSize.width: 128

                    MouseArea {
                        id: mouseArea1
                        anchors.fill: parent
                        onEntered: if (!playing) button5.source = "play_pressed.png"; else button5.source = "stop_pressed.png";
                        onExited: if (!playing) button5.source = "play.png"; else button5.source = "stop.png";
                    }
                }
                Button {
                    Layout.minimumWidth: 300
                    text: qsTr("Back")
                    onClicked: main.state = "normal";
                }
            }
        }
    }

    states: [
        State {
            name: "prize"

            PropertyChanges {
                target: normal
                rotation: 360
                scale: 0
                z: 0
                opacity: 0
            }
            PropertyChanges {
                target: prize
                scale: 1
                z: 2
                opacity: 1
            }
        },
        State {
            name: "settings"

            PropertyChanges {
                target: normal
                rotation: 360
                scale: 0
                z: 0
                opacity: 0
            }
            PropertyChanges {
                target: settings
                scale: 1
                z: 1
                opacity: 1
            }
        }
    ]

    transitions: [
        Transition {
            NumberAnimation {
                properties: "rotation,scale,opacity"
                duration: 1600
                easing.type: Easing.InOutQuad
            }
        }
    ]

}
