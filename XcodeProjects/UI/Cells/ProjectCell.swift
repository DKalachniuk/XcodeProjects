//
//  ProjectCell.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 09/03/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import SwiftUI

struct ProjectCell: View {
    let project: Project
    let searchText: String?
    @EnvironmentObject var preferences: Preferences

    var body: some View {
        VStack {
            HStack(spacing: 0) {
                
                ProjectNameView(project: self.project, searchText: searchText)
                    .environmentObject(preferences)

                Divider()
                    .frame(width: 1)
                    .padding(0)

                ProjectMenuView(project: self.project)
                    .environmentObject(preferences)
                    .frame(width: 40, height: 40, alignment: .center)
                    .background(RoundedCorners.right )
                    .modifier(OnHover(tl: 0, tr: 12, bl: 0, br: 12))
                    .modifier(OnHoverText())
            }

        }

    }
}

struct ProjectCell_Previews: PreviewProvider {
    static var previews: some View {
        ProjectCell(project: Project.dummy, searchText: "lu")
    }
}
