//
//  ProjectIcon.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 21/06/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import SwiftUI

struct ProjectIcon: View {
    let project: Project
    @EnvironmentObject var preferences: Preferences

    var body: some View {
        ZStack {
            if let iconPath = project.iconPath,
               let data = try? Data(contentsOf: URL(fileURLWithPath: iconPath)),
               let nsImage = NSImage(data: data) {
                Image(nsImage: nsImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                Rectangle()
                    .foregroundColor(Color.clear)
                    .background(Color(self.project.color.color))
                    .cornerRadius(8)

                Text(String(self.project.name.first ?? "-").capitalized)
                    .font(.system(size: 14, weight: Font.Weight.semibold))
                    .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4))
                    .foregroundColor(Color.white)
            }
            
        }
        .frame(width: 24, height: 24)
        .onTapGesture {
            let newColor = CodableColorPicker.shared.pickRandomColor()
            self.preferences.changeProjectsColor(self.project, newColor: newColor)
        }
        .onLongPressGesture { showImagePicker() }
    }
}

private extension ProjectIcon {
    func showImagePicker() {
        let dialog = NSOpenPanel()
        dialog.title = "Choose an icon for your project"
        dialog.showsResizeIndicator = true
        dialog.showsHiddenFiles = false
        dialog.canChooseDirectories = false
        dialog.canCreateDirectories = false
        dialog.allowsMultipleSelection = false
        dialog.canChooseFiles = true
        dialog.becomesKeyOnlyIfNeeded = true
        dialog.allowedFileTypes = ["png","jpg","jpeg"]
        dialog.begin { (result) -> Void in
            if result.rawValue == NSApplication.ModalResponse.OK.rawValue {
                guard let selectedPath = dialog.url?.path else { return }
                self.preferences.changeProjectsIcon(self.project, iconPath: selectedPath)
            }
        }
    }
}

struct ProjectIcon_Previews: PreviewProvider {
    static var previews: some View {
        ProjectIcon(project: Project.dummy)
    }
}
