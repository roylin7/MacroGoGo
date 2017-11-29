//
//  ExerciseTableViewController.swift
//  Project-Alpha
//
//  Created by Sheryar Ali on 11/29/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//

import UIKit

class ExerciseTableViewController: UITableViewController {

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
        return DataStore.shared.Ecount()
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        
        // Configure the cell...
        let elog = DataStore.shared.getElog(index: indexPath.row)
        
        cell.textLabel?.text = elog.logname
        
        
        return cell
    }

}
