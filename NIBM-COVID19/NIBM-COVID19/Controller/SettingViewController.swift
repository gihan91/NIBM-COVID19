//
//  SettingViewController.swift
//  NIBM-COVID19
//
//  Created by Gihan on 9/15/20.
//  Copyright © 2020 Gihan. All rights reserved.
//

import UIKit
import Firebase

class SettingViewController: UIViewController {

    @IBOutlet var txtTemp: UITextField!
    @IBOutlet var txtEmail: UITextField!

    let userID = Auth.auth().currentUser?.uid
    let ref = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionUpdate(_ sender: Any) {

        if let userID = self.userID {
            self.ref.child("users").child(userID).child("email").setValue(txtEmail.text)
            self.ref.child("users").child(userID).child("userTemp").setValue(txtTemp.text)
        } else {
            print("error")
        }
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
