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
    
    var fLogCount: Int = DataStore.shared.Fcount() // get count of all food logs entered

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // function returns a food log's date as string ("month-day-year")
    func getDate(foodlog: FoodLog) -> String {
        let date = foodlog.date
        let index =  date.index(date.startIndex, offsetBy: 10)
        let substring = date[..<index]
        return String(substring)
    }
    
    func getMacroLogs() -> [[String]] {
        var fLog: [[String]] = [] // empty array to store totality of food logs
        // each entry will be an array in and of itself; [carbStr, fatStr, protStr]
        var i: Int = 0 // initialize counter
        // parse through each OG food log and append to fLog array (2D List)
        while i < fLogCount {
            if fLogCount == 0 {
                i = fLogCount
            }
            var log = DataStore.shared.getFoodlog(index: i) // fetch OG food logs
            //var todayDate = Date()
            // fetch today's date and convert to String
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let todayStr1 = formatter.string(from: Date())
            let todayStr2 = formatter.date(from: todayStr1)
            formatter.dateFormat = "MM-dd-yyyy"
            let todayStr3 = formatter.string(from: todayStr2!)
            //let allDateStr:String! = String(allDate)
            //var allDateEdit =
            //var day =
            //var month =
            //var year =
            var logDate = getDate(foodlog: log) // fetch date associated with food log; String
            print("***test111***")
            print(logDate)
            print(todayStr3)
            print("~~~test222~~~")
            //if today == flogdate {
            var carbStr = log.carb
            var fatStr = log.fat
            var protStr = log.protein
            var tempLog: [String] = [] // tempLog is nested array
            tempLog.append(carbStr)
            tempLog.append(fatStr)
            tempLog.append(protStr)
            fLog.append(tempLog)
            i += 1 // increment counter
            //}
        }
        // returns 2D list with macro content strings
        return fLog
    }
    
    func getMacros(fLog: [[String]]) -> [Double] {
        var macroList: [Double] = [] // will store marco content in 1D array as Doubles
        var carbTotal: Double = 0
        var fatTotal: Double = 0
        var protTotal: Double = 0
        var i: Int = 0 // initialize counter
        while i < fLog.count {
            // parse 2D array and convert macro Strings to Doubles
            let carb:Double! = Double(fLog[i][0]) // get first element (== carb) from ith nested array in 2D list
            let fat:Double! = Double(fLog[i][1]) // second element == fat content
            let prot:Double! = Double(fLog[i][2]) // third element == protein content
            i += 1 // increment counter
            // increment total macro holders
            carbTotal += carb
            fatTotal += fat
            protTotal += prot
        }
        // apend total macro content placeholders to Doubles 1D list
        macroList.append(carbTotal)
        macroList.append(fatTotal)
        macroList.append(protTotal)
        return macroList
    }
    
    // button handler
    @IBAction func updateBtn(_ sender: Any) {
        let foodLogPend = getMacroLogs() // call function to generate 2D String list
        let foodLogFinal = getMacros(fLog: foodLogPend) // call function on 2D String list to convert to 1D Doubles list
        
        updateGraph(fLog: foodLogFinal) // update graph using 1D Doubles list
    }
    
    func updateGraph(fLog: [Double]) { // takes 1D Doubles list as parameter
        var i: Int = 0 // initialize counter
        var barGraphEntry = [BarChartDataEntry]() // initialize empty bar chart array to store datapoints
        
        while i < 3 {
            let entry = BarChartDataEntry(x: Double(i), y: fLog[i]) // set x (chronological) and y (actual macros) datapoints
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
