//
//  AddCustomCommandButton.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 23/02/2022.
//  Copyright © 2022 com.klm.mac.myProjects. All rights reserved.
//

import SwiftUI

struct AddCustomCommandButton: View {

    let action: (() -> Void)

    var body: some View {
        Button(action: action) {
            Image("terminal")
                .resizable()
                .renderingMode(.template)
                .frame(width: 16, height: 16)
                .foregroundColor(Color(NSColor.labelColor))
        }.buttonStyle(BorderlessButtonStyle())
    }
}
