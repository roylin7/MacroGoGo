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
    
    var numbers: [Double] = [] // array for input storage
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
    
    func getMacros(fLog: [[String]]) -> [Int] {
        var macroTemp: [Int] = []
        var i: Int = 0 // initialize counter1
        while i < fLog.count {
            let carb:Int! = Int(fLog[i][0])
            let fat:Int! = Int(fLog[i][1])
            let prot:Int! = Int(fLog[i][2])
            macroTemp.append(carb)
            macroTemp.append(fat)
            macroTemp.append(prot)
            i += 1 // increment counter1
        }
        print(macroTemp)
        return macroTemp
    }
    
    // button handler
    @IBAction func saveBtn(_ sender: Any) {
        let input = Double(textInput.text!) // take textbox input - should be double (higher precision float) or int data type
        numbers.append(input!) // add direct data entry to original array
        updateGraph()
        let foodLog = getMacroLogs()
        getMacros(fLog: foodLog)
    }
    
    func updateGraph() {
        var barGraphEntry: [ChartDataEntry] = Array() // new array with data to be displayed on chart
        
        for (i, number) in numbers.enumerated() {
            let value = BarChartDataEntry(x: Double(i), y: number) // set x and y datapoints
            barGraphEntry.append(value) // add (x, y) datapoint to dataset array
            
            let line1 = BarChartDataSet(values: barGraphEntry, label: "Number") // convert barGraphEntry to BarChartDataSet
            
            line1.colors = [NSUIColor.purple] // set color purple
            
            let data = BarChartData() // what will be added to bar graph
            data.addDataSet(line1) // add line to dataset
            macroChart.leftAxis.axisMinimum = 0.0
            macroChart.rightAxis.axisMinimum = 0.0
            macroChart.data = data // final data addition step with update
            
            macroChart.chartDescription?.text = "Macronutrient Tracker - Daily Values"
        }
    }
}
