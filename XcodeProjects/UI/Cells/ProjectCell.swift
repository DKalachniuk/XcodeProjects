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
                .background(RoundedCorners(color: Color.gray.opacity(0.25), tl: 5, tr: 0, bl: 5, br: 0) )
                .modifier(OnHover(tl: 5, tr: 0, bl: 5, br: 0))

                Divider().padding(0)

                ProjectMenuView(project: self.project)
                .environmentObject(preferences)
                .frame(width: 30, height: 30, alignment: .center)
                .background(RoundedCorners(color: Color.gray.opacity(0.25), tl: 0, tr: 5, bl: 0, br: 5) )
                .modifier(OnHover(tl: 0, tr: 5, bl: 0, br: 5))
            }

        }

    }
}

struct ProjectCell_Previews: PreviewProvider {
    static var previews: some View {
        ProjectCell(project: Project.dummy)
    }
}
