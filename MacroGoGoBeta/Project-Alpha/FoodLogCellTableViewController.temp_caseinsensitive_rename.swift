//
//  FoodlogcellTableViewController.swift
//  Project-Alpha
//
//  Created by Roy Lin on 11/30/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//

import UIKit

class FoodLogCellTableViewController: UITableViewController {

    var flogs : [FoodLog]!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return flogs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodlogname", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = String(flogs[indexPath.row].foodname)
        
        return cell
    }
}
