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
    
    var fLogCount: Int = DataStore.shared.Fcount() // get count of all food logs entered for day

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getMacroLogs() -> [[String]] {
        var fLog: [[String]] = [] // empty array to store totality of food logs for day in
        // each entry will be an array in and of itself; [carbStr, fatStr, protStr]
        var i: Int = 0 // initialize counter
        // parse through each food log and append to fLog array
        while i < fLogCount {
            if fLogCount == 0 {
                i = fLogCount
            }
            var log = DataStore.shared.getFoodlog(index: i)
            var carbStr = log.carb
            var fatStr = log.fat
            var protStr = log.protein
            var tempLog: [String] = []
            tempLog.append(carbStr)
            tempLog.append(fatStr)
            tempLog.append(protStr)
            fLog.append(tempLog)
            i += 1 // increment counter
        }
        // returns 2D list with macro content strings
        return fLog
    }
    
    func getMacros(fLog: [[String]]) -> [Double] {
        var macroList: [Double] = []
        var carbTotal: Double = 0
        var fatTotal: Double = 0
        var protTotal: Double = 0
        var i: Int = 0 // initialize counter
        while i < fLog.count {
            let carb:Double! = Double(fLog[i][0])
            let fat:Double! = Double(fLog[i][1])
            let prot:Double! = Double(fLog[i][2])
            i += 1 // increment counter
            carbTotal += carb
            fatTotal += fat
            protTotal += prot
        }
        macroList.append(carbTotal)
        macroList.append(fatTotal)
        macroList.append(protTotal)
        return macroList
    }
    
    // button handler
    @IBAction func saveBtn(_ sender: Any) {
        let foodLogPend = getMacroLogs()
        let foodLogFinal = getMacros(fLog: foodLogPend)
        
        updateGraph(fLog: foodLogFinal)
    }
    
    func updateGraph(fLog: [Double]) {
        var i: Int = 0 // initialize counter
        var barGraphEntry = [BarChartDataEntry]()
        
        while i < 3 {
            let entry = BarChartDataEntry(x: Double(i), y: fLog[i]) // set x and y datapoints
            barGraphEntry.append(entry) // add (x, y) datapoint to dataset array
            
            let line1 = BarChartDataSet(values: barGraphEntry, label: "") // convert barGraphEntry to BarChartDataSet
            
            line1.colors = [NSUIColor.purple] // set color purple
            
            let data = BarChartData() // what will be added to bar graph
            data.addDataSet(line1) // add line to dataset
            macroChart.leftAxis.axisMinimum = 0.0
            macroChart.rightAxis.axisMinimum = 0.0
            macroChart.data = data // final data addition step with update
            
            macroChart.chartDescription?.text = ""
            i += 1 // increment counter
        }
    }
}
