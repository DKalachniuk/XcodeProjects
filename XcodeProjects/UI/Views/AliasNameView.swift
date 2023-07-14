//
//  AliasNameView.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 14/07/2023.
//  Copyright © 2023 com.klm.mac.myProjects. All rights reserved.
//

import SwiftUI

struct AliasNameView: View {
    
    let alias: Alias
    
    var body: some View {
        HStack {
            Spacer()
            Text(alias.name)
            Spacer()
        }
        .frame(height: 40)
        .background(RoundedCorners.left)
        .modifier(OnHover(tl: 12, tr: 0, bl: 12, br: 0))
        
    }
}

struct AliasCellView_Previews: PreviewProvider {
    static var previews: some View {
        AliasNameView(alias: Alias(name: "pod install"))
    }
}
