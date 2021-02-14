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

    @UserDefaultsBacked(key: "has_bank_accounts", defaultValue: false)
    static var hasBankAccounts

    @UserDefaultsBacked(key: "temp_cards", defaultValue: ["ATB card", "Express Bank", "Ubank", "YeloCard"])
    static var bankCards
}
