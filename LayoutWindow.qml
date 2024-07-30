import QtQuick
import QtQuick.Layouts

Window {
    id: root

    width: 800
    height: 600
    visible: true
    color: "lightyellow"
    title: "Layout window"

    GridLayout {
        anchors.fill: parent

        rows: 2 // Nb de lignes
        columns: 2 // Nb de colonnes
        rowSpacing: 10 // Espace entre les lignes
        columnSpacing: 10 // Espace entre les colonnes

        Item {
            id: item1
            // Permet de rendre l'espace accessible dans le GridLayout pour cet Item
            Layout.fillWidth: true
            Layout.fillHeight: true

            Rectangle {
                width: 50
                height: 50

                x: 50
                y: 50

                color: "orange"
            }
        }

        Item {
            id: item2
            Layout.fillWidth: true
            Layout.fillHeight: true

            Rectangle {
                anchors {
                    top: parent.verticalCenter
                    left: parent.horizontalCente
                }

                width: 100
                height: 75

                color: "darkred"
            }
        }

        Item {
            id: item3
            Layout.fillWidth: true
            Layout.fillHeight: true

            Flow {
                anchors.fill: parent

                spacing: 20

                Repeater { // Répète un nombre particulier d'objet
                    model: 5

                    Rectangle {
                        width: 50
                        height: 50

                        color: "green"
                    }
                }
            }
        }

        Item {
            id: item4
            Layout.fillWidth: true
            Layout.fillHeight: true

            GridLayout {
                anchors.fill: parent

                rows: 2
                columns: 2

                rowSpacing: 20
                columnSpacing: 20

                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    color: "black"
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    color: "red"
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    Layout.columnSpan: 2 // Permet de remplir le nombre de colonnes renseignées

                    color: "blue"
                }
            }
        }
    }
}
