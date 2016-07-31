//
//  Map.swift
//  classQuest
//
//  Created by zz on 2016-07-30.
//  Copyright © 2016 Zena Potts. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class Map: UIViewController {
    
    var buildingsStringNew = String()
    var xStringNew = String()
    var yStringNew = String()
    var zOne = Double()
    var zTwo = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let zOne = Double(xStringNew)
        let zTwo = Double(yStringNew)
        let camera = GMSCameraPosition.cameraWithLatitude(zOne!,longitude: zTwo!, zoom: 15)
        let mapView = GMSMapView.mapWithFrame(.zero, camera: camera)
        mapView.myLocationEnabled = true
        self.view = mapView
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(zOne!, zTwo!)
        marker.title = buildingsStringNew
        marker.map = mapView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}