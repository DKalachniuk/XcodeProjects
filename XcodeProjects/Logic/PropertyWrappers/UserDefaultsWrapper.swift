//
//  UserDefaultsWrapper.swift
//  KLCommons
//
//  Created by Dima Kalachniuk on 17/06/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import Foundation

private protocol AnyOptional {
    var isNil: Bool { get }
}

extension Optional: AnyOptional {
    var isNil: Bool { self == nil }
}

@propertyWrapper
public struct UserDefault<T> {
    let key: String
    let defaultValue: T

    var storage: UserDefaults = .standard

    public init(_ key: String, defaultValue: T, storage: UserDefaults = .standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.storage = storage
    }

    public var wrappedValue: T {
        get {
            UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            if let optional = newValue as? AnyOptional, optional.isNil {
                storage.removeObject(forKey: key)
            } else {
                storage.setValue(newValue, forKey: key)
            }
        }
    }
}

public extension UserDefault where T: ExpressibleByNilLiteral {
     init(_ key: String, storage: UserDefaults = .standard) {
        self.init(key, defaultValue: nil, storage: storage)
    }
}
