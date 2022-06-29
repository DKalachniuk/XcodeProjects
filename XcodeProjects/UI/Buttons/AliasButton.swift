//
//  AliasButton.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 29/06/2022.
//  Copyright © 2022 com.klm.mac.myProjects. All rights reserved.
//

import SwiftUI

struct AliasdButton: View {
    let alias: Alias
    var completion: (() -> Void)?

    var body: some View {
        Button(action: {
            AppDelegate.closePopover()
            NSWorkspace.execute(command: .alias(command: alias.name))
            completion?()
        }) {
            Text(alias.name)
        }
    }
}
