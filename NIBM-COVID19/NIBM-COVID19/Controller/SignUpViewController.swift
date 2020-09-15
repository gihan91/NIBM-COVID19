//
//  SignUpViewController.swift
//  NIBM-COVID19
//
//  Created by Gihan on 9/3/20.
//  Copyright © 2020 Gihan. All rights reserved.
//

import UIKit
import CoreLocation

class SignUpViewController: UIViewController {

    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var txtUserType: UITextField!

    var userTypes = ["Student", "Academic Staff", "Non-Academic Staff"]
    var pickerUserTypes = UIPickerView()
    let getLocation = LocationManager()
    var lat: CLLocationDegrees?
    var long: CLLocationDegrees?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        self.pickerUserTypes.delegate = self
        self.pickerUserTypes.dataSource = self

        self.txtUserType.inputView = pickerUserTypes
        getCurrentLocation()

    }

    fileprivate func getCurrentLocation() {
        getLocation.getCurrentLocation { (res) in
            if let loc = res?.coordinate {
                self.lat = loc.latitude
                self.long = loc.longitude
            }
        }
    }

    private func validationForSignUp() -> Bool {
        if let email = txtEmail.text, let password = txtPassword.text, let userType = txtUserType.text {
            if email != "" && password != "" && userType != "" {
                Services.registerUser(withEmail: email, passwordIs: password, UserType: userType, latitude: lat!, longitude: long!) { (succes) in
                    if succes {
                        self.goToHomeVC()
                    } else {
                        Alert.showMessage(title: "Warning", msg: "Wrong email or password", on: self)
                        
                    }
                }
                return true
            } else {
                Alert.showMessage(title: "Warning", msg: "Please Check All Fields", on: self)
                return false
            }
        }
        return false
    }

    fileprivate func goToHomeVC() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "tabBarHome") as! UITabBarController
        self.navigationController?.pushViewController(newViewController, animated: true)

    }

    @IBAction func actionSignUp(_ sender: Any) {
        if validationForSignUp() {
            
        }
    }
}

extension SignUpViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return userTypes.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return userTypes[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.txtUserType.text = userTypes[row]
        self.txtUserType.resignFirstResponder()
    }


}
