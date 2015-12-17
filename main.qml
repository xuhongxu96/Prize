import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

ApplicationWindow {
    title: qsTr("PRIZE Draw!        By: xuhongxu.cn")
    width: 1024
    height: 768
    visible: true

    MainForm {
        id: main
        Timer {
            id: runTimer
            interval: 20
            running: false
            repeat: true
            onTriggered: {
                main.i = parseInt(Math.random() * main.users.length);
                main.stateText.text = main.users[main.i];
            }
        }

        anchors.fill: parent
        exit.onClicked: Qt.quit();
        save.onClicked: {
            users = userList.text.split('\n');
            i = -1;
            main.state = "normal";
        }
        cancel.onClicked: {
            userList.text = users.join('\n');
            main.state = "normal";
        }

        play.onClicked: {
            if (playing) {
                playing = false;
                runTimer.running = false;
                playImage.source = "play.png";
                if (stateText.text) {
                    prizeList.model.append({"name": stateText.text, "num": (++num).toString()});
                    if (i != -1) {
                        users.splice(i, 1);
                    }
                    stopAnim.running = true;
                }
            } else {
                if (users.length <= 0) {
                    return;
                }
                playing = true;
                stateText.text = "";
                runTimer.running = true;
                playImage.source = "stop.png";
            }
        }
    }

}
