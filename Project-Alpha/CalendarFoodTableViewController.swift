//
//  CalendarFoodTableViewController.swift
//  Project-Alpha
//
//  Created by Sheryar Ali on 12/7/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//

import UIKit

class CalendarFoodTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataStore.shared.Fcount()
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid2", for: indexPath)
        
        // Configure the cell...
        let flog = DataStore.shared.getFoodlog(index: indexPath.row)
        
        cell.textLabel?.text = flog.foodname
        
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "flog" {
            // Get the table view row that was tapped.
            if let indexPath = tableView.indexPathForSelectedRow {
                let vc = segue.destination as! CalendarFoodViewController
                // Pass the selected data model object to the destination view controller.
                vc.flogs = DataStore.shared.getFoodlog(index: indexPath.row)
                // Set the navigation bar back button text.
                // If you don't do this, the back button text is this screens title text.
                // If this screen didn't have any nav bar title text, the back button text would be 'Back', by default.
                let backItem = UIBarButtonItem()
                backItem.title = "FLOG LIST"
                navigationItem.backBarButtonItem = backItem
            }
        }
    }
    
    
    


}
