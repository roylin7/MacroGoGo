//
//  ExLogViewController.swift
//  Project-Alpha
//
//  Created by Roy Lin on 11/29/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//

import UIKit

class ExLogViewController: UIViewController {

    var elogs : ExerciseLog!
    @IBOutlet weak var logname: UILabel!
    @IBOutlet weak var elog: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabels()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    private func setLabels() {
        logname.text = elogs.logname
        elog.text = elogs.log 
    }

}
