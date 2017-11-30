//
//  DateCellTableViewController.swift
//  Project-Alpha
//
//  Created by Roy Lin on 11/29/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//

import UIKit

class DateCellTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

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
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "date", for: indexPath)
        
        // Configure the cell...
        var foodlogs = [FoodLog]()
        var i: Int = 0
        while i < DataStore.shared.Fcount() {
            foodlogs.append(DataStore.shared.getFoodlog(index: i))
            i += 1
        }
        
        let datelist = DataStore.shared.getDateList(foologs: foodlogs)
        cell.textLabel?.text = datelist[indexPath.row]
        
        return cell
    }
   
}
