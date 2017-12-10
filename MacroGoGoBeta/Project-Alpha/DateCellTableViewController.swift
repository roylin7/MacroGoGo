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
        
<<<<<<< HEAD:Project-Alpha/DateCellTableViewController.swift
=======
        
>>>>>>> master:MacroGoGoBeta/Project-Alpha/DateCellTableViewController.swift
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
        return DataStore.shared.Fcount()
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "date", for: indexPath)
        
        // Configure the cell...
        let flog = DataStore.shared.getFoodlog(index: indexPath.row)
        
        cell.textLabel?.text = flog.foodname
        
        
        return cell
    }
<<<<<<< HEAD:Project-Alpha/DateCellTableViewController.swift
   
   
    
    
    
=======
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "flog" {
            // Get the table view row that was tapped.
            if let date = tableView.dequeueReusableCell(withIdentifier: "date")?.textLabel{
                print(String(describing: date))
                let vc = segue.destination as! FoodLogCellTableViewController
                // Pass the selected data model object to the destination view controller.
                vc.flogs = DataStore.shared.getFoodlogsByDate(date:String(describing: date))
                // Set the navigation bar back button text.
                // If you don't do this, the back button text is this screens title text.
                // If this screen didn't have any nav bar title text, the back button text would be 'Back', by default.
                let backItem = UIBarButtonItem()
                backItem.title = "Date LIST"
                navigationItem.backBarButtonItem = backItem
            }
        }
    }
>>>>>>> master:MacroGoGoBeta/Project-Alpha/DateCellTableViewController.swift
}
