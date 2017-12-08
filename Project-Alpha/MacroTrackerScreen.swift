//
//  MacroTrackerScreen.swift
//  Project-Alpha
//
//  Created by Harrison Thomas on 12/7/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//

import UIKit
import Charts

class MacroTrackerScreen: UIViewController {
    
    @IBOutlet weak var macroChart: BarChartView!
    @IBOutlet weak var textInput: UITextField!
    
    var numbers: [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
