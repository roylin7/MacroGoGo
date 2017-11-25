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
        setupCalendar()
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var year : UILabel!
    @IBOutlet weak var month : UILabel!
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    
    
    func setupCalendar () {
        calendarView.visibleDates { (visibleDates) in
            self.setCalendar(from: visibleDates)
            
        }
        
    }
    
    func setCalendar(from visibleDates: DateSegmentInfo) {
        let date = visibleDates.monthDates.first!.date
        
        self.format.dateFormat = "yyyy"
        self.year.text = self.format.string(from: date)
        
        self.format.dateFormat = "MMMM"
        self.month.text = self.format.string(from: date)
    }
}


extension FoodLogViewController: JTAppleCalendarViewDataSource{
    
    
    func configureCalendar(_ calender: JTAppleCalendarView) -> ConfigurationParameters {
        
        format.dateFormat = "yyyy MM dd"
        format.timeZone=Calendar.current.timeZone
        format.locale = Calendar.current.locale
        
        let startDate = format.date(from: "2017 01 01")
        let endDate = format.date(from: "2030 12 31")
        let parameters = ConfigurationParameters(startDate: startDate!, endDate: endDate!)
        return parameters
    }
    
    
    
    
}

extension FoodLogViewController: JTAppleCalendarViewDelegate {
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "c", for: indexPath) as! CustomCell
        
        cell.dateLabel.text = cellState.text
        if cellState.isSelected {
            cell.selectView.isHidden = false
        }
        else{
            cell.selectView.isHidden = true
        }
        return cell
    }
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "c", for: indexPath) as! CustomCell
        cell.dateLabel.text = cellState.text
    }
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        guard let validcell = cell as? CustomCell else { return }
        validcell.selectView.isHidden = false
        }
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        guard let validcell = cell as? CustomCell else { return }
        validcell.selectView.isHidden = true
    }
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        setCalendar(from: visibleDates)
        
    }
    
}
