//
//  CalendarFoodViewController.swift
//  Project-Alpha
//
//  Created by Sheryar Ali on 12/7/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//

import UIKit

class CalendarFoodViewController: UIViewController {

    var flogs: FoodLog!
    
    @IBOutlet weak var carboyhdrates: UILabel!
    @IBOutlet weak var fat: UILabel!
    @IBOutlet weak var log: UILabel!
    @IBOutlet weak var name: UILabel!
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
        log.text = flogs.foodname
        name.text = flogs.protein
        fat.text = flogs.fat
        carboyhdrates.text = flogs.carb
    }

}
