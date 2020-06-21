//
//  NSColor+Codable.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 21/06/2020.
//  Copyright © 2020 com.klm.mac.myProjects. All rights reserved.
//

import AppKit

public struct CodableColor {

    /// The color to be (en/de)coded
    let color: NSColor
}

extension CodableColor: Encodable {

    public func encode(to encoder: Encoder) throws {
        let nsCoder = NSKeyedArchiver(requiringSecureCoding: true)
        color.encode(with: nsCoder)
        var container = encoder.unkeyedContainer()
        try container.encode(nsCoder.encodedData)
    }
}

extension CodableColor: Decodable {

    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        let decodedData = try container.decode(Data.self)
        let nsCoder = try NSKeyedUnarchiver(forReadingFrom: decodedData)
        self.color = NSColor(coder: nsCoder).unsafelyUnwrapped
    }
}

public extension NSColor {
    func codable() -> CodableColor {
        return CodableColor(color: self)
    }
}
