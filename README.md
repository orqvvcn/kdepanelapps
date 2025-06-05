# underline with boucing apps for the breeze theme default panel (kde plasma)


https://github.com/user-attachments/assets/c9dc1f63-29a8-4c69-b824-57ce9c4b5f10

## Install
```
git clone --depth 1 https://github.com/bali10050/kdepanelapps
cd ./kdepanelapps
cp -a /usr/share/plasma/desktoptheme/default ~/.local/share/plasma/desktoptheme
cp -a ./tasks.svgz ~/.local/share/plasma/desktoptheme/default/widgets/
cp -a /usr/share/plasma/plasmoids/org.kde.plasma.taskmanager ~/.local/share/plasma/plasmoids
cp -a ./Task.qml ~/.local/share/plasma/plasmoids/org.kde.plasma.taskmanager/contents/ui/
```

Make sure breeze is selected as your plasma style, then reboot and it should be working
