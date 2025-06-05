[![Watch the video]()](https://github.com/orqvvcn/kdepanelapps/blob/main/k.mp4)



You need to copy and paste to your desktop the default folder in /usr/share/plasma/desktoptheme/default and alter the tasks.svgz in /usr/share/plasma/desktoptheme/default/widgets/tasks.svgz with inkscape and make everything transparent.

the altered default folder needs to be placed in the local folder to not mess up the original folder /usr/local/share/plasma/desktoptheme you need to create the desktoptheme if there's not one. I use kio-admin to make edits inside the root folder.

you need to copy the plasmoid org.kde.plasma.taskmanager in /usr/share/plasma/plasmoids/org.kde.plasma.taskmanager and then alter the qml file Task.qml in /usr/share/plasma/plasmoids/org.kde.plasma.taskmanager/contents/ui/Task.qml and replace the kirigami.icon with the code.

then place the altered plasmoid org.kde.plasma.taskmanager in the local folder, /usr/local/share/plasma/plasmoids, you need to create the plasmoids folder if there's not one

log out and log in and it should be working
