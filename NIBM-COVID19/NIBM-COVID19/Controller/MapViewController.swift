//
//  MapViewController.swift
//  NIBM-COVID19
//
//  Created by Gihan on 9/10/20.
//  Copyright © 2020 Gihan. All rights reserved.
//

import UIKit
import GoogleMaps
import Firebase

class MapViewController: UIViewController {

    @IBOutlet var viewMap: GMSMapView!
    let getLocation = LocationManager()

    var userArray = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getUserLatAndLong()

    }

    override func viewWillAppear(_ animated: Bool) {
        getCurrentLocation()
    }

    func getUserLatAndLong() {
        let ref = Database.database().reference().child("users")
        ref.observe(.childAdded, with: { (snapshot) in
            print(snapshot)
            guard let dictionary = snapshot.value as? [String : AnyObject] else {
                return
            }

            let Obj = User()
            Obj.email = dictionary["email"] as? String
            Obj.lat = dictionary["lat"] as? Double
            Obj.long = dictionary["long"] as? Double
            Obj.userType = dictionary["usertype"] as? String
            Obj.status = dictionary["status"] as? Bool


            self.userArray.append(Obj)
            self.setMarkersOnMap()

        }, withCancel: nil)

    }

    func setMarkersOnMap() {
        for state in self.userArray {
            if state.status ?? false {
                let lat = Double(state.lat!)
                let long = Double(state.long!)

                let stateMarker = GMSMarker()
                stateMarker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
                stateMarker.snippet = state.email
                stateMarker.map = self.viewMap
            }
        }
    }

    fileprivate func getCurrentLocation() {
        getLocation.getCurrentLocation { (res) in
            if let loc = res?.coordinate {
                let lat = loc.latitude
                let long = loc.longitude
                let currentLocationZoom = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 6)
                self.viewMap.camera = currentLocationZoom
            }
        }
    }

}


