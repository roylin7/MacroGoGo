//
//  LoadFoodlogViewController.swift
//  Project-Alpha
//
//  Created by Roy Lin on 11/29/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//
import UIKit

class LoadFoodlogViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
<<<<<<< HEAD:Project-Alpha/LoadFoodLogViewController.swift
=======
>>>>>>> master
        var foodlog = [FoodLog]()
        let num = DataStore.shared.Fcount()
        var i = 0
        while i < num{
            let log = DataStore.shared.getFoodlog(index: i)
            i += 1
            foodlog.append(log)
            print(log.foodname)
        }
        
        
<<<<<<< HEAD

=======
        DataStore.shared.loadFoodlog()
=======
>>>>>>> master
        
>>>>>>> master:MacroGoGoBeta/Project-Alpha/LoadFoodLogViewController.swift
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
