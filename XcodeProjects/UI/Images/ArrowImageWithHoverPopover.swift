//
//  ArrowImageWIthHoverPopover.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 01/07/2020.
//  Copyright © 2020 com.klm.mac.myProjects. All rights reserved.
//

import SwiftUI

struct ArrowImageWithHoverPopover: View {
    @State var project: Project
    @State private var noXcodeProjectHover: Bool = false

    var body: some View {
        ArrowImage()
        .opacity(project.hasXcodeProject ? 1.0 : 0.1)
        .onHover(perform: { hovered in
            if !self.project.hasXcodeProject {
                self.noXcodeProjectHover = hovered
            }
        })
        .popover(isPresented: $noXcodeProjectHover, content: {
            VStack(alignment: .trailing, spacing: 6) {
                Text("No Xcode project/workspace was found 😔")
            }
            .foregroundColor(Color(.secondaryLabelColor))
            .font(.system(size: 11))
            .padding()
        })
    }
}

struct ArrowImageWIthHoverPopover_Previews: PreviewProvider {
    static var previews: some View {
        ArrowImageWithHoverPopover(project: Project.dummy)
    }
}
