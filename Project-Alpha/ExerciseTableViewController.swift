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

        DataStore.shared.loadElog()
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

}
