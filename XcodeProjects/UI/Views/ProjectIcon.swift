//
//  ProjectIcon.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 21/06/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import SwiftUI

struct ProjectIcon: View {
    @State var project: Project
    @EnvironmentObject var preferences: Preferences

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.clear)
                .background(Color(self.project.color.color))
                .cornerRadius(8)

            Text(String(self.project.name.first ?? "-").capitalized)
                .font(.system(size: 14, weight: Font.Weight.semibold))
                .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4))
                .foregroundColor(Color.white)

        }
        .frame(width: 24, height: 24)
        .onTapGesture {
            let newColor = CodableColorPicker.shared.pickRandomColor()
            self.preferences.changeProjectsColor(self.project, newColor: newColor)
        }
    }
}

struct ProjectIcon_Previews: PreviewProvider {
    static var previews: some View {
        ProjectIcon(project: Project.dummy)
    }
}
