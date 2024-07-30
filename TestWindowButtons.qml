import QtQuick

Window {
    id: root

    width: 800
    height: 600
    visible: true
    color: "grey"
    title: "Test window"

    Rectangle {

        id: button1

        property color baseColor: "lightskyblue"

        signal mySignal()

        anchors {
            bottom: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
            bottomMargin: 20
        }

        width: 150
        height: 50
        radius: 20

        color: if (buttonMouseArea1.containsPress) {
                   return Qt.darker(baseColor)
               } else if (buttonMouseArea1.containsMouse) {
                    return Qt.lighter(baseColor)
               } else {
                    return baseColor
               }

        Text {
            id: buttonText1

            anchors.centerIn: parent

            text: "Click here"
        }

        MouseArea {
            id: buttonMouseArea1

            anchors.fill: parent // Permet de rendre le rectangle clickable sur toute sa surface

            hoverEnabled: true

            onClicked: {
                root.test()
            }
        }
    }

    Rectangle {
        id: button2

        property color baseColor: "orange"

        signal mySignal()

        anchors {
            top: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
            topMargin: 20
        }

        width: 150
        height: 50
        radius: 20

        color: if (buttonMouseArea2.containsPress) {
                   return Qt.darker(baseColor)
               } else if (buttonMouseArea2.containsMouse) {
                    return Qt.lighter(baseColor)
               } else {
                    return baseColor
               }

        Text {
            id: buttonText2

            anchors.centerIn: parent

            text: "Quit"
        }

        MouseArea {
            id: buttonMouseArea2

            anchors.fill: parent // Permet de rendre le rectangle clickable sur toute sa surface

            hoverEnabled: true

            onClicked: {
                root.quit()
            }
        }
    }

    function test() {
        button1.baseColor = "lightgreen"
        console.log("Clicked")
    }

    function quit() {
        Qt.quit()
    }

    Connections {
        target: buttonMouseArea2

        function onClicked() {
            console.log("Quit application")
        }
    }
}
