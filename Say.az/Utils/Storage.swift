//
//  Storage.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/16/20.
//

import Foundation

struct Storage {
    @UserDefaultsBacked(key: "is_logged", defaultValue: false)
    static var isLogged
}