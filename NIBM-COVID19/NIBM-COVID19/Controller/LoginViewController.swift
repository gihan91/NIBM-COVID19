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

    }
    
    @IBAction func actionLogin(_ sender: Any) {
        guard let email = txtEmail.text, let password = textPassword.text else {
            return
        }
        Services.login(email: email, password: password)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
