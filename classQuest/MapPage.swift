//
//  MapPage.swift
//  ClassQuest
//
//  Created by zz on 2016-07-30.
//  Copyright © 2016 Zena Potts. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class MapPage: UIViewController {
    
    var buildingsPass = String()
    var xPass = String()
    var yPass = String()
    var x = Double()
    var y = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let x = Double(xPass)
        let y = Double(yPass)
        let camera = GMSCameraPosition.cameraWithLatitude(x!,longitude: y!, zoom: 15)
        let mapView = GMSMapView.mapWithFrame(.zero, camera: camera)
        mapView.myLocationEnabled = true
        self.view = mapView
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(x!, y!)
        marker.title = buildingsPass
        marker.map = mapView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
