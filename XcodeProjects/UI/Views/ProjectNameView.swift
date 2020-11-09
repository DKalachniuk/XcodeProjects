//
//  ProjectNameView.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 22/06/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import SwiftUI

struct ProjectNameView: View {
    let project: Project
    let searchText: String?

    @EnvironmentObject var preferences: Preferences

    var body: some View {
        HStack {

            Spacer()
                .frame(width: 8)

            if self.preferences.showProjectIcon {
                ProjectIcon(project: project).environmentObject(preferences)
            }

            UIKLabel(attributedText: project.attributedName(for: searchText))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))


            Spacer()
            Button(action: {
                AppDelegate.closePopover()
                NSWorkspace.execute(command: .openWorkspace, forProject: self.project)
            }) {
                ArrowImageWithHoverPopover(project: self.project)
            }
            .buttonStyle(BorderlessButtonStyle())
            .padding([.trailing], 5)
            .modifier(OnHoverText())

            Spacer().frame(width: 3)
        }
        .frame(height: 40)
        .background(RoundedCorners.left)
        .modifier(OnHover(tl: 12, tr: 0, bl: 12, br: 0))
    }
}

private extension Project {
    func attributedName(for searchText: String?) -> NSAttributedString {
        guard let searchText = searchText else {
            return NSAttributedString(string: name)
        }

        let mutableAttributedString = NSMutableAttributedString(string: name)
        for letter in searchText {
            let range = (name as NSString).range(of: String(letter))
            mutableAttributedString.addAttribute(NSAttributedString.Key.font, value: NSFont.boldSystemFont(ofSize: 14), range: range)
        }
        return mutableAttributedString
    }
}

struct ProjectNameView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectNameView(project: Project.dummy, searchText: "lu")
    }
}
