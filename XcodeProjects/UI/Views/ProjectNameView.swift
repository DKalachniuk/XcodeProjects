//
//  ProjectNameView.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 22/06/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import SwiftUI

struct ProjectNameView: View {
    @State var project: Project

    var body: some View {
        HStack {
            Spacer()
                .frame(width: 8)
            ProjectIcon(project: project)
            Text(self.project.name)
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 5))

            Spacer()
            Button(action: {
                NSWorkspace.execute(command: .openWorkspace, forProject: self.project)
            }) {
                ArrowImageWithHoverPopover(project: self.project)
            }
            .buttonStyle(BorderlessButtonStyle())
            .padding([.trailing], 5)
            .modifier(OnHoverText())

            Spacer().frame(width: 3)
        }
        .frame(height: 40, alignment: .center)
        .background(RoundedCorners.left)
        .modifier(OnHover(tl: 12, tr: 0, bl: 12, br: 0))
    }
}

struct ProjectNameView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectNameView(project: Project.dummy)
    }
}
