//
//  ProjectNameView.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 22/06/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import SwiftUI

struct ProjectNameView: View {
    let project: Project
    @EnvironmentObject var preferences: Preferences

    var body: some View {
        HStack {

            Spacer()
                .frame(width: 8)

            if self.preferences.showProjectIcon {
                ProjectIcon(project: project).environmentObject(preferences)
            }

            Text(self.project.name)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
           
            // open project
            Spacer()
            Button(action: {
                AppDelegate.closePopover()
                NSWorkspace.execute(command: .openWorkspace, forProject: self.project)
            }) {
                ArrowImageWithHoverPopover(project: self.project)
            }
            .buttonStyle(BorderlessButtonStyle())
            .padding([.trailing], 5)
            .modifier(OnHoverText())

            // open package swift if exists
            if project.hasSwiftPackage {
                Button(action: {
                    AppDelegate.closePopover()
                    NSWorkspace.execute(command: .openSwiftPackage, forProject: self.project)
                }) {
                    PackageSwiftImage()
                }
                .buttonStyle(BorderlessButtonStyle())
                .padding([.trailing], 5)
                .modifier(OnHoverText())
            }
            
            Spacer().frame(width: 3)
        }
        .frame(height: 40)
        .background(RoundedCorners.left)
        .modifier(OnHover(tl: 12, tr: 0, bl: 12, br: 0))
    }
}

struct ProjectNameView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectNameView(project: Project.dummy)
    }
}
