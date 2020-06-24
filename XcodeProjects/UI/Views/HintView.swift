//
//  HintView.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 24/06/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import SwiftUI

struct HintView: View {

    @State var showCloseButton = false

    var body: some View {
        VStack {
            Spacer().frame(height: 8)
            HStack {
                ArrowImage(size: .small)
                    .foregroundColor(Color.secondary)
                Text("- open with Xcode. Click 􀍠 for more options")
                    .font(Font.system(size: 10))
                    .foregroundColor(Color.secondary)
                Spacer()
                if showCloseButton {
                    HStack {
                        Button(action: {

                        }, label: {
                            CloseHintImage()
                        })
                        .buttonStyle(BorderlessButtonStyle())
                        .frame(width: 10, height: 10, alignment: .center)

                        Spacer().frame(width: 15)
                    }
                }
            }
                .padding(.leading, 10)
                .onHover { result in
                    self.showCloseButton = result
                }
        }
        .opacity(0.8)
    }
}

struct HintView_Previews: PreviewProvider {
    static var previews: some View {
        HintView()
    }
}
