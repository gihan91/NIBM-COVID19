//
//  AlertManager.swift
//  NIBM-COVID19
//
//  Created by Gihan on 9/10/20.
//  Copyright © 2020 Gihan. All rights reserved.
//

import Foundation
import UIKit

class Alert {

   static func showMessage(title: String, msg: String, `on` controller: UIViewController) {
    let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
    controller.present(alert, animated: true, completion: nil)
    }
}
