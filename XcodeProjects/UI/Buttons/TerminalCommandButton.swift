//
//  TerminalCommandButton.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 11/03/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import SwiftUI

struct TerminalCommandButton: View {
    let project: Project
    let command: TerminalCommand
    
    var body: some View {
        Button(action: {
            AppDelegate.closePopover()
            NSWorkspace.execute(command: self.command, forProject: self.project)
        }) {
            Text(command.rawValue)
        }
    }
}

struct TerminalCommandButton_Previews: PreviewProvider {
    static var previews: some View {
        TerminalCommandButton(project: Project.dummy, command: .podInstall)
    }
}
