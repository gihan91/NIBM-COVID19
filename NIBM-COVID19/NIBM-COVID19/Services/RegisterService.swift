//
//  RegisterService.swift
//  NIBM-COVID19
//
//  Created by Gihan on 9/3/20.
//  Copyright © 2020 Gihan. All rights reserved.
//

import Foundation
import FirebaseAuth
import CoreLocation
import FirebaseDatabase

class Services {
    typealias CompletionHandler = (_ success:Bool) -> Void

    static func registerUser(withEmail email: String, passwordIs password: String, UserType userType: String, latitude lat: CLLocationDegrees, longitude lon: CLLocationDegrees, completionHandler: CompletionHandler?) {

        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("error with create user \(error.localizedDescription)")
                return
            }
            guard let uuid = result?.user.uid else { return }
            let values = ["email": email, "usertype": userType,"lat": lat, "long": lon, "password": password] as [String : Any]
            Database.database().reference().child("users").child(uuid).updateChildValues(values) { (error, ref) in
                if let error = error {
                    print("failed to update database with error: \(error.localizedDescription)")
                    return
                }
                print("successfully create a user")
            }
        }

    }

    static func login(email: String, password: String,completion: @escaping CompletionHandler) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("Cant log in\(error)")
                completion(false)
                return
            } else {
                completion(true)
                print("Successfully log in")
            }

        }
    }
}
