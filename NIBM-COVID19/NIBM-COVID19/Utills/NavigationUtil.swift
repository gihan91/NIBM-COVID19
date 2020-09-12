//
//  NavigationUtil.swift
//  NIBM-COVID19
//
//  Created by Gihan on 9/10/20.
//  Copyright © 2020 Gihan. All rights reserved.
//

import Foundation
import UIKit

class Utill: UIViewController {

    static let sharedInstance = Utill()

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
