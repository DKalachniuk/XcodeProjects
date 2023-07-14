//
//  PackageSwiftImage.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 12/07/2023.
//  Copyright © 2023 com.klm.mac.myProjects. All rights reserved.
//

import SwiftUI

struct PackageSwiftImage: View {

    var size: ArrowSize = .normal

    var body: some View {
        Image("packageSwift")
            .resizable()
            .renderingMode(.template)
            .frame(width: size.width, height: size.height, alignment: .center)
    }
}

struct PackageSwiftImagee_Previews: PreviewProvider {
    static var previews: some View {
        ArrowImage()
    }
}
