//
//  DividerSection.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 20/03/2021.
//  Copyright © 2021 com.klm.mac.myProjects. All rights reserved.
//

import SwiftUI

struct DividerSection: View {

    let title: String?

    var body: some View {
        VStack {
            Divider()
            if let title = title {
                Text(title)
            }
        }
    }
}
