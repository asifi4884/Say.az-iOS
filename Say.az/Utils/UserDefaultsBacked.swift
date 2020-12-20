//
//  UserDefaultsBacked.swift
//  Mobil Notariat
//
//  Created by Ulxan Emiraslanov on 5/22/20.
//  Copyright © 2020 Ulxan Emiraslanov. All rights reserved.
//

import Foundation

@propertyWrapper struct UserDefaultsBacked<Value> {
    let key: String
    let defaultValue: Value
    var storage: UserDefaults = .standard

    var wrappedValue: Value {
        get {
            let value = storage.value(forKey: key) as? Value
            return value ?? defaultValue
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


private protocol AnyOptional {
    var isNil: Bool { get }
}

extension Optional: AnyOptional {
    var isNil: Bool { self == nil }
}
