//
//  UserModel.swift
//  NIBM-COVID19
//
//  Created by Gihan on 9/12/20.
//  Copyright © 2020 Gihan. All rights reserved.
//

import Foundation

class User {
    var email: String?
    var lat: Double?
    var long: Double?
    var userType: String?
    var status: Bool?
    var userTemp: Double?
    var userArray:UserObj?
}

struct UserObj {
    var userCount: [User] = [User]()
}
