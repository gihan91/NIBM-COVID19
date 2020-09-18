//
//  InfectedUsersViewController.swift
//  NIBM-COVID19
//
//  Created by Gihan on 9/10/20.
//  Copyright © 2020 Gihan. All rights reserved.
//

import UIKit
import Charts
import FirebaseAuth
import Firebase

class InfectedUsersViewController: UIViewController {
    @IBOutlet var chartInfectedUsers: PieChartView!

    var studentCount: [Int] = [Int]()
    var studentEmail: [String] = [String]()

    var userObj: User?
    var numberOfData = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utill.sharedInstance.setupNavigationBar(title: "")
        getUserObject()

    }

    func customizeChart(dataPoints: [String], values: [Double]) {
      // TO-DO: customize the chart here
        // 1. Set ChartDataEntry
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
          let dataEntry = PieChartDataEntry(value: values[i], label: dataPoints[i], data: dataPoints[i] as AnyObject)
          dataEntries.append(dataEntry)
        }
        // 2. Set ChartDataSet
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: nil)
        pieChartDataSet.colors = colorsOfCharts(numbersOfColor: dataPoints.count)
        // 3. Set ChartData
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        pieChartData.setValueFormatter(formatter)
        // 4. Assign it to the chart’s data
        chartInfectedUsers.data = pieChartData
    }

    //Use Random Colors
    private func colorsOfCharts(numbersOfColor: Int) -> [UIColor] {
      var colors: [UIColor] = []
      for _ in 0..<numbersOfColor {
        let red = Double(arc4random_uniform(256))
        let green = Double(arc4random_uniform(256))
        let blue = Double(arc4random_uniform(256))
        let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
        colors.append(color)
      }
      return colors
    }


    //Getting User object
    public func getUserObject() {
        let ref = Database.database().reference().child("users")
        ref.observe(.childAdded, with: { (snapshot) in
            print(snapshot)
            guard let dictionary = snapshot.value as? [String : AnyObject] else {
                return
            }

            //Create object
            let Obj = User()
            Obj.email = dictionary["email"] as? String
            Obj.lat = dictionary["lat"] as? Double
            Obj.long = dictionary["long"] as? Double
            Obj.userType = dictionary["usertype"] as? String
            Obj.status = dictionary["status"] as? Bool
            Obj.userTemp = dictionary["userTemp"] as? Double



            if Obj.status == true {
                 if Obj.userType == "Academic Staff" {
                    self.studentEmail.append(Obj.userType ?? "")
                    self.studentCount.append(Obj.userType?.count ?? 0 )
                }

                self.customizeChart(dataPoints: self.studentEmail, values: self.studentCount.map{ Double($0) })
            }




        }, withCancel: nil)
    }

    //Not use
    func get(arr: Int) {
        print("::::array count is \(arr)")
    }

}
