Kirigami.Icon {
    id: icon
    anchors.fill: parent
    active: false
    enabled: true
    source: model.decoration
    z: 999
    clip: false

    transform: Translate {
        id: iconTranslate
        y: 0
    }

   

}





Item {
    anchors.fill: parent
    z: 1000   // Ensure it's on top
    
    
    Timer {
    id: launchDelayTimer
    interval: 350
    repeat: false
    onTriggered: {
        TaskTools.activateTask(modelIndex(), model, Qt.NoModifier, task, Plasmoid, tasksRoot, effectWatcher.registered);
    }
}


    TapHandler {
        acceptedButtons: Qt.LeftButton
        gesturePolicy: TapHandler.ReleaseWithinBounds // triggers when released inside
        

        




onTapped: (eventPoint, button) => {
    // Bounce always on click
    clickBounceAnim.restart();

    if (!model.IsWindow) {
        // App is closed: bounce first, delay launch
        launchDelayTimer.start();
    } else {
        // App is open: activate normally
        TaskTools.activateTask(modelIndex(), model, eventPoint.modifiers, task, Plasmoid, tasksRoot, effectWatcher.registered);
    }

    eventPoint.accepted = false;
}


    }
    
    
    
    

}






SequentialAnimation {
    id: clickBounceAnim
    running: false
    loops: 1

    ScriptAction {
        script: {
            bounceDown.from = iconTranslate.y
            bounceDown.to = 6
        }
    }

    PropertyAnimation {
        id: bounceDown
        target: iconTranslate
        property: "y"
        duration: 100
        easing.type: Easing.InOutCubic
    }

    PropertyAnimation {
        target: iconTranslate
        property: "y"
        to: -10
        duration: 160
        easing.type: Easing.OutCubic
    }

    PropertyAnimation {
        target: iconTranslate
        property: "y"
        to: 0
        duration: 160
        easing.type: Easing.InCubic
    }
} 
  
        
        
          
           
        
        
Rectangle {
    id: openBar
    width: model.IsWindow && model.IsActive ? 28 : 12
    height: 2.5
    radius: height / 2
    anchors.horizontalCenter: icon.horizontalCenter
    anchors.bottom: icon.bottom
    anchors.bottomMargin: -1.5

    color: model.IsWindow && model.IsActive
        ? Qt.rgba(1, 1, 1, 0.8)  // Qt.rgba(0.239, 0.682, 0.913, 1.0) 
        : Qt.rgba(1, 1, 1, 0.5)             // white with 50% opacity

    visible: model.IsWindow && !model.IsLauncher

    // Animate width change
    Behavior on width {
        NumberAnimation {
            duration: 200
            easing.type: Easing.InOutQuad
        }
    }

    // Animate color change
    Behavior on color {
        ColorAnimation {
            duration: 200
            easing.type: Easing.InOutQuad
        }
    }
}



