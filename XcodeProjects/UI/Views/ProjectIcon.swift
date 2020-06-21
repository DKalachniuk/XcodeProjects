//
//  ProjectIcon.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 21/06/2020.
//  Copyright © 2020 com.klm.mac.myProjects. All rights reserved.
//

import SwiftUI

struct ProjectIcon: View {
    @State var project: Project

    var body: some View {
        Text(String(self.project.name.first ?? "-").capitalized)
        .font(.system(size: 14, weight: Font.Weight.semibold))
        .padding(EdgeInsets(top: 2, leading: 4, bottom: 2, trailing: 4))
        .foregroundColor(Color.white)
        .background(Color(self.project.color.color))
        .frame(width: 24, height: 24)
        .cornerRadius(8)
    }
    
}

struct ProjectIcon_Previews: PreviewProvider {
    static var previews: some View {
        ProjectIcon(project: Project.dummy)
    }
}