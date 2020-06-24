//
//  CloseHintImage.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 24/06/2020.
//  Copyright © 2020 com.klm.mac.myProjects. All rights reserved.
//

import SwiftUI

struct CloseHintImage: View {
    var body: some View {
        Image("close")
        .resizable()
        .renderingMode(.template)
        .frame(width: 15, height: 15, alignment: .center)
    }
}

struct CloseHintImage_Previews: PreviewProvider {
    static var previews: some View {
        CloseHintImage()
    }
}
