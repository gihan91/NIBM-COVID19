//
//  AuthenticationManager.swift
//  NIBM-COVID19
//
//  Created by Gihan on 9/12/20.
//  Copyright © 2020 Gihan. All rights reserved.
//

import Foundation
import UIKit

class AuthenticationManager {

static func updateRootVC() {
    var rootVC: UIViewController?
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let status = UserDefaults.standard.bool(forKey: UserDefaultManager.loginStatus)

    guard let navigationVC = storyBoard.instantiateInitialViewController() as? UINavigationController else { return }

    if let currentVC = UserDefaultManager.getStringValue(key: UserDefaultManager.keyCurrentVC), status {
        rootVC = storyBoard.instantiateViewController(withIdentifier: currentVC)
        navigationVC.setNavigationBarHidden(true, animated: true)
    } else {
        rootVC = storyBoard.instantiateViewController(withIdentifier: "viewController") as! ViewController
    }

    navigationVC.viewControllers = [rootVC!]

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.window?.rootViewController = navigationVC
    appDelegate.window?.makeKeyAndVisible()

    }

    
}
