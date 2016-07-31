//
//  MapPage.swift
//  classQuest
//
//  Created by zz on 2016-07-30.
//  Copyright © 2016 Zena Potts. All rights reserved.
//

import Foundation
import UIKit

class MapPage: UIViewController {
    
    @IBOutlet weak var BuildingName: UILabel!
    @IBOutlet weak var DirectionsText: UITextView!
    
    var buildingsString = String()
    var directionsString = String()
    var latitudeString = String()
    var longitudeString = String()
    var xString = String()
    var yString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BuildingName.text = buildingsString
        DirectionsText.text = directionsString
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "GoToMap"){
            let destinationTwo = segue.destinationViewController as? Map
            destinationTwo!.buildingsStringNew = buildingsString
            destinationTwo!.xStringNew = xString
            destinationTwo!.yStringNew = yString
        }
    }
}