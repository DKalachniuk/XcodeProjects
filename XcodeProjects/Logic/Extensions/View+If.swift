//
//  View+If.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 11/03/2021.
//  Copyright © 2021 com.klm.mac.myProjects. All rights reserved.
//

import SwiftUI

extension View {
    @ViewBuilder
    func `if`<Transform: View>(
        _ condition: Bool,
        transform: (Self) -> Transform
    ) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
