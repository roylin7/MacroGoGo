//
//  FoodLogViewController.swift
//  Project-Alpha
//
//  Created by Sheryar Ali on 11/24/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//

import UIKit
import JTAppleCalendar

class FoodLogViewController: UIViewController {
    let format = DateFormatter()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension FoodLogViewController: JTAppleCalendarViewDataSource, JTAppleCalendarViewDelegate{
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        
            let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "c", for: indexPath) as! CustomCell
            cell.dateLabel.text = cellState.text
    }
    
    
    
    


    func configureCalendar(_ calender: JTAppleCalendarView) -> ConfigurationParameters {
        
        format.dateFormat = "yyyy MM dd"
        format.timeZone=Calendar.current.timeZone
        format.locale = Calendar.current.locale
        
        let startDate = format.date(from: "2017 01 01")
        let endDate = format.date(from: "2030 12 31")
        let parameters = ConfigurationParameters(startDate: startDate!, endDate: endDate!)
        return parameters
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "c", for: indexPath) as! CustomCell
        cell.dateLabel.text = cellState.text
        return cell
    }
    
}
