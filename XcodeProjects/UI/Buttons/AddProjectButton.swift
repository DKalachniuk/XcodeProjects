//
//  PlusButton.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 17/06/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import SwiftUI

struct AddProjectButton: View {

    let action: (() -> Void)

    var body: some View {
        Button(action: action) {
            Image("add")
                .resizable()
                .renderingMode(.template)
                .frame(width: 16, height: 16)
                .foregroundColor(Color(NSColor.labelColor))
        }.buttonStyle(BorderlessButtonStyle())
    }
}

