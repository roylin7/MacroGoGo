//
//  SaveFoodlogController.swift
//  Project-Alpha
//
//  Created by Roy Lin on 11/29/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SaveFoodlogController: UIViewController {
   
    var alertController:UIAlertController? = nil
    @IBOutlet weak var foodname: UITextField!
    @IBOutlet weak var fat: UITextField!
    @IBOutlet weak var carb: UITextField!
    @IBOutlet weak var protein: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func savefoodlog(_ sender: Any) {
        if foodname.text! == "" || fat.text! == "" || carb.text! == "" || protein.text == "" {
            self.alertController = UIAlertController(title: "Error", message: "Please complete 'foodname'/fat/carb/protein ", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
        }
        else {
            let currentDate = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd"
            
            let date = formatter.string(from: currentDate)
            let uid = Auth.auth().currentUser?.uid
            
            let newFoodLog = FoodLog(uid: uid!, date: date, foodname: foodname.text!, carb: carb.text!, fat: fat.text!, protein: protein.text!)
            
            DataStore.shared.addFoodlog(foodlog: newFoodLog)
            
            self.alertController = UIAlertController(title: "Thank you ", message: "saved ", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
        }
        
    }
    

    

}
