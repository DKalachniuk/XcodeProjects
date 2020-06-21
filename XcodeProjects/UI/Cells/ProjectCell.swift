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
            Spacer().frame(width: nil, height: 5, alignment: .center)
            HStack {

                Spacer().frame(width: 8)

                ProjectIcon(project: self.project)

                Spacer().frame(width: 8)

                Text(self.project.name.capitalized)
                    .font(.system(size: 14, weight: Font.Weight.semibold))
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

                ProjectMenuView(project: self.project).environmentObject(preferences)
            }
            .frame(width: nil, height: 40, alignment: .center)
            .background(Color.gray.opacity(0.25))
            .cornerRadius(5)
            Spacer().frame(width: nil, height: 5, alignment: .center)
        }

    }
}

struct ProjectCell_Previews: PreviewProvider {
    static var previews: some View {
        ProjectCell(project: Project.dummy)
    }
}
