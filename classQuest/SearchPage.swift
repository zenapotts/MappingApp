//
//  SearchPage.swift
//  ClassQuest
//
//  Created by zz on 2016-07-30.
//  Copyright © 2016 Zena Potts. All rights reserved.
//

import Foundation
import UIKit

class SearchPage: UITableViewController{
    var buildings = [String]()
    var x = [String]()
    var y = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImage.image = UIImage(named: "jHall")
        self.view.insertSubview(backgroundImage, atIndex: 0)
        let path = NSBundle.mainBundle().pathForResource("Data", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        
        buildings = dict!.objectForKey("Buildings") as! [String]
        x = dict!.objectForKey("x") as! [String]
        y = dict!.objectForKey("y") as! [String]
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.buildings.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
            cell.textLabel?.text = self.buildings[indexPath.row]
        cell.backgroundColor = .clearColor()
        cell.textLabel!.textColor = UIColor.whiteColor()
     
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "GoToMapPage"){
            let destination = segue.destinationViewController as? MapPage
            let Index = tableView.indexPathForSelectedRow?.row
            destination!.buildingsPass = buildings[Index!]
            destination!.xPass = x[Index!]
            destination!.yPass = y[Index!]
        }
    }
}