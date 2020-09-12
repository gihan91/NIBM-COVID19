//
//  LoginViewController.swift
//  NIBM-COVID19
//
//  Created by Gihan on 9/3/20.
//  Copyright © 2020 Gihan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var textPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        //Hide keyboard when click background
        self.hideKeyboardWhenTappedAround()
        Utill.sharedInstance.setupNavigationBar(title: "")

    }
    
    @IBAction func actionLogin(_ sender: Any) {
        if userLoginValidation() {}
    }

    private func userLoginValidation() -> Bool {
        if let email = txtEmail.text, let password = textPassword.text {
            if email != "" && password != "" {
                Services.login(email: email, password: password) { (success) in
                    if success {
                        self.goToHomeVC()
                    } else {
                        Alert.showMessage(title: "Warning", msg: "Wrong email or password", on: self)
                    }
                }
                return true
            } else {
                //fails
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

}
