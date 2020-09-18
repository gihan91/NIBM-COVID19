//
//  FirstViewController.swift
//  NIBM-COVID19
//
//  Created by Gihan on 9/15/20.
//  Copyright © 2020 Gihan. All rights reserved.
//

import UIKit
import Firebase

//Change class name
class HaveSymptomsViewController: UIViewController {
    
     let userID = Auth.auth().currentUser?.uid
    let ref = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionYes(_ sender: Any) {
        if let userID = self.userID {
                   self.ref.child("users").child(userID).child("haveSymptoms").setValue(true)
               }
    }
    
    @IBAction func actionNo(_ sender: Any) {
        if let userID = self.userID {
            self.ref.child("users").child(userID).child("haveSymptoms").setValue(false)
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
