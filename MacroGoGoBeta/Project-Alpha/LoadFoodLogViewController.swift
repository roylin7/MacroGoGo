
//
//  loadFoodlogViewController.swift
//  Project-Alpha
//
//  Created by Roy Lin on 11/29/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//
import UIKit

class loadFoodlogViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD:Project-Alpha/LoadFoodLogViewController.swift
        var foodlog = [FoodLog]()
        let num = DataStore.shared.Fcount()
        var i = 0
        while i < num{
            let log = DataStore.shared.getFoodlog(index: i)
            i += 1
            foodlog.append(log)
            print(log.foodname)
        }
        
        

=======
        DataStore.shared.loadFoodlog()
        
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
