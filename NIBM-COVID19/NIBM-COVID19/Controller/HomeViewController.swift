//
//  HomeViewController.swift
//  NIBM-COVID19
//
//  Created by Gihan on 9/10/20.
//  Copyright © 2020 Gihan. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class HomeViewController: UIViewController {

    let userID = Auth.auth().currentUser?.uid
    var hasCovid: Bool = false
    let ref = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar(title: "")

    }

    @IBAction func actionInfectedUser(_ sender: Any) {
        let refreshAlert = UIAlertController(title: "Do you have COVID-19 ", message: "Are you sure?", preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            self.sendPatientStatus()
        }))

        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))

        present(refreshAlert, animated: true, completion: nil)
    }

    func sendPatientStatus() {
        if let userID = self.userID {
            self.ref.child("users").child(userID).child("status").setValue(true)
        }
        
    }
    
    public func setupNavigationBar(title: String) {
        self.navigationItem.title = title
        //        _ = [NSAttributedString.Key.foregroundColor:UIColor.cruzouBlueishBlack]
        //        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: UIParam, size: 21)!]
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = UIColor.white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear

    }

}

