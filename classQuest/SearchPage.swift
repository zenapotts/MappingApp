//
//  SearchPage.swift
//  classQuest
//
//  Created by zz on 2016-07-30.
//  Copyright © 2016 Zena Potts. All rights reserved.
//

import Foundation
import UIKit

class SearchPage: UITableViewController, UISearchResultsUpdating {
    var buildings = ["ROZH 101", "ROZH 104", "WMEM 103", "SSC 3303", "SSC 2104"]
    var filteredBuildings = [String]()
    var directions = ["Directions, Directions, Directions, Directions, Directions, Directions, Directions, Directions, Directions, Directions, Directions, Directions", "Directions2, Directions2, Directions2, Directions2, Directions2, Directions2, Directions2, Directions2, Directions2, Directions2, Directions2, Directions2", "Directions3, Directions3, Directions3, Directions3, Directions3, Directions3, Directions3, Directions3, Directions3, Directions3, Directions3, Directions3", " Directions4, Directions4, Directions4, Directions4, Directions4, Directions4, Directions4, Directions4, Directions4, Directions4, Directions4, Directions4", "Directions5, Directions5, Directions5, Directions5, Directions5, Directions5, Directions5, Directions5, Directions5, Directions5, Directions5, Directions5"]
    var x = ["43.5322267", "43.5322267", "43.5322267", "43.5322267", "43.5322267"]
    var y = ["-80.2258579","-80.2258579","-80.2258579","-80.2258579","-80.2258579"]
    var searchController: UISearchController!
    var resultsController = UITableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resultsController.tableView.dataSource = self
        self.resultsController.tableView.delegate = self
        self.searchController = UISearchController(searchResultsController: self.resultsController)
        self.tableView.tableHeaderView = self.searchController.searchBar
        self.searchController.searchResultsUpdater = self
        self.searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.filteredBuildings = self.buildings.filter { (buildings:String) -> Bool in
            if buildings.containsString(self.searchController.searchBar.text!){
                return true
            }
            return false
        }
        self.resultsController.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView{
            return self.buildings.count
        } else {
            return self.filteredBuildings.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        if tableView == self.tableView {
           cell.textLabel?.text = self.buildings[indexPath.row]
        } else {
            cell.textLabel?.text = self.filteredBuildings[indexPath.row]
        }
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "GoToMapPage"){
            let destination = segue.destinationViewController as? MapPage
            let Index = tableView.indexPathForSelectedRow?.row
            destination!.buildingsString = buildings[Index!]
            destination!.directionsString = directions[Index!]
            destination!.xString = x[Index!]
            destination!.yString = y[Index!]
        }
    }
}