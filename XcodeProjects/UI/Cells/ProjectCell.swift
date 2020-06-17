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
        ProjectMenuView(project: self.project).environmentObject(preferences)
    }
}

struct ProjectCell_Previews: PreviewProvider {
    static var previews: some View {
        ProjectCell(project: Project.dummy)
    }
}
