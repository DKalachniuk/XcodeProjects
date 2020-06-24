//
//  ArrowImage.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 24/06/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import SwiftUI

enum ArrowSize {
    case normal
    case small

    var width: CGFloat {
        self == .normal ? 20 : 14
    }

    var height: CGFloat {
        self == .normal ? 16.5 : 10
    }
}

struct ArrowImage: View {

    var size: ArrowSize = .normal

    var body: some View {
        Image("arrow")
            .resizable()
            .renderingMode(.template)
            .frame(width: size.width, height: size.height, alignment: .center)
    }
}

struct ArrowImage_Previews: PreviewProvider {
    static var previews: some View {
        ArrowImage()
    }
}
