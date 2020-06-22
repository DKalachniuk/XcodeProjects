//
//  OnHover.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 22/06/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import SwiftUI

struct OnHover: ViewModifier {
    @State private var isHovered = false

    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0

    func body(content: Content) -> some View {
        content
            .onHover(perform: { isHovered in
                self.isHovered = isHovered
            })
            .background(isHovered ?
                RoundedCorners(color: Color.primary.opacity(0.2), tl: self.tl, tr: self.tr, bl: self.bl, br: self.br) :
                RoundedCorners(color: Color.clear))
    }
}
