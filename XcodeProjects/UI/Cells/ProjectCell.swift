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
        VStack {
            HStack(spacing: 0) {
                
                ProjectNameView(project: self.project)

                Divider()
                    .frame(width: 1)
                    .padding(0)

                ProjectMenuView(project: self.project)
                    .environmentObject(preferences)
                    .frame(width: 30, height: 30, alignment: .center)
                    .background(RoundedCorners.right )
                    .modifier(OnHover(tl: 0, tr: 5, bl: 0, br: 5))
                    .modifier(OnHoverText())
            }

        }

    }
}

struct ProjectCell_Previews: PreviewProvider {
    static var previews: some View {
        ProjectCell(project: Project.dummy)
    }
}
