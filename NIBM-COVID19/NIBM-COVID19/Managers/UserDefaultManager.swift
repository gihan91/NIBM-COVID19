//
//  UserDefaultManager.swift
//  NIBM-COVID19
//
//  Created by Gihan on 9/12/20.
//  Copyright © 2020 Gihan. All rights reserved.
//

import Foundation

class UserDefaultManager {
    static let keyCurrentVC: String = "current-view-controller"
    static let loginStatus: String = "login-status"

    //User defaults for login
    static func setValue(key: String, value: Bool) {
        UserDefaults.standard.set(value, forKey: key)
    }

    static func setValue(key: String, value: [String]) {
        UserDefaults.standard.set(value, forKey: key)
    }

    static func getStringValue(key: String) -> String? {
        if let value = UserDefaults.standard.string(forKey: key) {
            return value
        }
        return nil
    }

    static func getIntValue(key: String) -> Int? {
        if UserDefaults.standard.integer(forKey: key) > 0 {
            return UserDefaults.standard.integer(forKey: key)
        }
        return nil
    }

    static func getBoolValue(key: String) -> Bool {
        return UserDefaults.standard.bool(forKey: key)
    }

    static func getArrayValue(key: String) -> [String]? {
        return UserDefaults.standard.array(forKey: key) as? [String]
    }

    static func removeValue(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
