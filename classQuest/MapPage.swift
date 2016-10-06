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
    var latitudePass = String()
    var longitudePass = String()
    var latitude = Double()
    var longitude = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let latitude = Double(latitudePass)
        let longitude = Double(longitudePass)
        let camera = GMSCameraPosition.cameraWithLatitude(latitude!,longitude: longitude!, zoom: 10)
        let mapView = GMSMapView.mapWithFrame(.zero, camera: camera)
        mapView.myLocationEnabled = true
        self.view = mapView
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(latitude!, longitude!)
        marker.title = buildingsPass
        marker.map = mapView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
