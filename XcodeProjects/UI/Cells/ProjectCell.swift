//
//  ProjectCell.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 09/03/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import SwiftUI

struct ProjectCell: View {
    @State var project: Project
    @EnvironmentObject var preferences: Preferences

    var body: some View {
        HStack {
            Text(self.project.name)
                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                .frame(width: 223, height: 30, alignment: .leading)

            Button(action: {
                NSWorkspace.execute(command: .openWorkspace, forProject: self.project)
            }) {
                Image("arrow")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 18, height: 15, alignment: .center)
            }
                .buttonStyle(BorderlessButtonStyle())
                .padding([.trailing], 5)

            ProjectMenuView(project: self.project).environmentObject(preferences)
        }
        .background(Color.gray.opacity(0.5))
        .cornerRadius(5)

    }
}

struct ProjectCell_Previews: PreviewProvider {
    static var previews: some View {
        ProjectCell(project: Project.dummy)
    }
}
