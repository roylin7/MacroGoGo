//
//  FoodLogViewController.swift
//  Project-Alpha
//
//  Created by Sheryar Ali on 11/24/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//
import UIKit
import JTAppleCalendar

protocol VC2Protocol {
    func date2(year: String, cell: CustomCell)
}
class FoodLogViewController: UIViewController {
    var delegate: VC2Protocol?
    let format = DateFormatter()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCalendar()
        
<<<<<<< HEAD
<<<<<<< HEAD:Project-Alpha/FoodLogViewController.swift
       
=======
>>>>>>> master:MacroGoGoBeta/Project-Alpha/FoodLogViewController.swift
=======
        
>>>>>>> master
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var year : UILabel!
    @IBOutlet weak var month : UILabel!
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    var day = "0"
    
    func setupCalendar () {
        calendarView.visibleDates { (visibleDates) in
            self.setCalendar(from: visibleDates)
        }
        
    }
    
    
    
    
    func setCalendar(from visibleDates: DateSegmentInfo) {
        let date = visibleDates.monthDates.first!.date
        
        self.format.dateFormat = "yyyy"
        self.year.text = self.format.string(from: date)
        
        self.format.dateFormat = "MM"
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
    
    
<<<<<<< HEAD

=======
    
>>>>>>> master
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
        let day = cellState.text
        print(day)
        print(self.month.text!)
        print(self.year.text!)
    }
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        guard let validcell2 = cell as? CustomCell else { return }
        validcell2.selectView.isHidden = false
        
        self.delegate?.date2(year: year.text!, cell: validcell2)
<<<<<<< HEAD
<<<<<<< HEAD:Project-Alpha/FoodLogViewController.swift
=======
>>>>>>> master
        let day = cellState.text
        print(day)
        print(self.month.text!)
        print(self.year.text!)
<<<<<<< HEAD
        }
=======
=======
>>>>>>> master
    }
>>>>>>> master:MacroGoGoBeta/Project-Alpha/FoodLogViewController.swift
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        guard let validcell = cell as? CustomCell else { return }
        validcell.selectView.isHidden = true
    }
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        setCalendar(from: visibleDates)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "haha" {
            // Get the table view row that was tapped.
            let vc = segue.destination as! CalendarFoodTableViewController
            // Pass the selected data model object to the destination view controller.
            let num = DataStore.shared.Fcount()
            var i = 0
            var list = [FoodLog]()
            while i < num {
                var log = DataStore.shared.getFoodlog(index: i)
                list.append(log)
                i += 1
            }
            let month = self.month.text!
            let year = self.year.text!
            let day1 = day
            
            let date = year+"-" + month + "-" + day1
            print(date)
            let newlist = DataStore.shared.getFoodlogsByDate(date: date, foodlogs: list)
            print(newlist[0].carb)
            vc.newlist1 = newlist
            
            
            // Set the navigation bar back button text.
            // If you don't do this, the back button text is this screens title text.
            // If this screen didn't have any nav bar title text, the back button text would be 'Back', by default.
            let backItem = UIBarButtonItem()
            backItem.title = "Calendar"
            navigationItem.backBarButtonItem = backItem
        }
    }
    
}
