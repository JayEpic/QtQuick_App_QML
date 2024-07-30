import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    id: root

    width: 640
    height: 480
    visible: true
    title: "Custom Item window"

    Rectangle {
        id: topbar

        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }

        height: 50
        color: "#85C7F2"
    }

    Rectangle {
        id: mainSection

        anchors {
            top: topbar.bottom
            bottom: bottombar.top
            left: parent.left
            right: parent.right
        }

        color: "#414141"

        AudioInfoBox {
            id: firstSong

            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                right: parent.right
                margins: 20
            }

            songIndex: 0
            title: "The Middle"
            author: "Zedd"
            imageColor: "red"
        }

        AudioInfoBox {
            id: secondSong

            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                right: parent.right
                margins: 20
            }

            songIndex: 1
            title: "Shape of You"
            author: "Ed Sheeran"
            imageColor: "orange"
        }

        AudioInfoBox {
            id: thirdSong

            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                right: parent.right
                margins: 20
            }

            songIndex: 2
            title: "Checklist"
            author: "MAX"
            imageColor: "yellow"
        }
    }

    Rectangle {
        id: bottombar

        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        height: 100
        color: "#636363"

        Row {
            anchors.centerIn: parent

            spacing: 20

            TextButton {
                id: previousButton

                width: 50
                height: 50

                text: "<"

                onClicked: {
                    playerController.switchToPreviousSong()
                }
            }

            TextButton {
                id: playPauseButton

                width: 75
                height: 50

                text: playerController.playing ? "Pause" : "Play"

                onClicked: {
                    playerController.playPause()
                }
            }

            TextButton {
                id: nextButton

                width: 50
                height: 50

                text: ">"

                onClicked: {
                    playerController.switchToNextSong()
                }
            }
        }
    }

    QtObject {
        id: playerController

        property int currentSongIndex: 0
        property int songCount: 3
        property bool playing: false

        function playPause() {
            // Playing
        }

        function switchToPreviousSong() {
            if (currentSongIndex > 0) {
                currentSongIndex--
            } else {
                currentSongIndex = songCount - 1
            }
        }

        function switchToNextSong() {
            if (currentSongIndex + 1 > songCount) {
                currentSongIndex = 0
            } else {
                currentSongIndex++
            }
        }
    }
}
