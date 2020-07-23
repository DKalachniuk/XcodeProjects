//
//  OnHoverText.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 22/06/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import SwiftUI

struct OnHoverText: ViewModifier {
    @State private var isHovered = false

    func body(content: Content) -> some View {
        content
            .onHover(perform: { isHovered in
                self.isHovered = isHovered
            })
            .foregroundColor(isHovered ? Color.primary : Color.primary.opacity(0.5))
    }
}

