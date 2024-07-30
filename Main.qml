import QtQuick

Window {
    id: root

    width: 800
    height: 600
    visible: true
    color: "black"

    Rectangle {
        id: rectangle

        property bool iAmPretty : true

        signal mySignal()

        anchors.centerIn: parent
        width: 150
        height: 150

        rotation: 45
        radius: 20

        color: mouseArea.containsPress ? "red" : "white"

        MouseArea {
            id: mouseArea

            anchors.fill: parent // Permet de rendre le rectangle clickable sur toute sa surface

            onClicked: {
                root.test()
            }
        }
    }

    function test() {
        // Fonctionnalité
    }
}
