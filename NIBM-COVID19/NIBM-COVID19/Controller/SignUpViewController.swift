//
//  SignUpViewController.swift
//  NIBM-COVID19
//
//  Created by Gihan on 9/3/20.
//  Copyright © 2020 Gihan. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var txtUserType: UITextField!

    var userTypes = ["Student", "Academic Staff", "Non-Academic Staff"]
    var pickerUserTypes = UIPickerView()
    let getLocation = LocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        self.pickerUserTypes.delegate = self
        self.pickerUserTypes.dataSource = self

        self.txtUserType.inputView = pickerUserTypes



    }

    fileprivate func getCurrentLocation() {
        getLocation.getCurrentLocation { (res) in
            if let loc = res?.coordinate {
                print(":::: res lat is \(loc.latitude)")
            }
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
