//
//  UIKitLabel.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 09/11/2020.
//  Copyright © 2020 com.klm.mac.myProjects. All rights reserved.
//

import SwiftUI
import AppKit

struct UIKLabel: NSViewRepresentable {
    let attributedText: NSAttributedString

    typealias NSViewType = NSTextField

    fileprivate var configuration = { (view: NSViewType) in }

    func makeNSView(context: NSViewRepresentableContext<UIKLabel>) -> NSTextField {
        let label = NSTextField(labelWithAttributedString: attributedText)
        label.isBezeled = false
        label.isEditable = false
        return label
    }

    func updateNSView(_ nsView: NSTextField, context: NSViewRepresentableContext<UIKLabel>) {
        configuration(nsView)
    }

    init(attributedText: NSAttributedString) {
        self.attributedText = attributedText
    }
}
