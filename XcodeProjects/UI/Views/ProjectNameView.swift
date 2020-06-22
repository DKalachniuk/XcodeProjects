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
            Text(self.project.name)
                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))

            Spacer()

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
        }
        .frame(width: nil, height: 30, alignment: .center)
        .background(RoundedCorners.left)
        .modifier(OnHover(tl: 5, tr: 0, bl: 5, br: 0))
    }
}

struct ProjectNameView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectNameView(project: Project.dummy)
    }
}
