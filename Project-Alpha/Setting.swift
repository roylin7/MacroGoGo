//
//  Setting.swift
//  Project-Alpha
//
//  Created by Roy Lin on 10/31/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//

import UIKit

class Setting: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Setting"
        print("ViewController1: viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewController1: viewWillAppear")
    }
    var alertController:UIAlertController? = nil
    @IBOutlet weak var lbltargetfat: UITextField!
    @IBOutlet weak var lbltargetpotein: UITextField!
    @IBOutlet weak var targetcarbohydrate: UITextField!

    @IBOutlet weak var lblpwagain: UITextField!
    @IBOutlet weak var lblbmi: UILabel!
    @IBOutlet weak var lblheightf: UITextField!
    @IBOutlet weak var lblheighti: UITextField!
    @IBOutlet weak var lblweight: UITextField!
    
    @IBAction func BMIindex(_ sender: Any) {
        if lbltargetfat.text == "" && lbltargetpotein.text == "" && targetcarbohydrate.text == "" && lblheightf.text == "" && lblheighti.text == "" && lblweight.text == "" {
            
            self.alertController = UIAlertController(title: "Error", message: "Please enter your information.", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
        }
        if lbltargetpotein.text == "" {
            
            self.alertController = UIAlertController(title: "Error", message: "Please fill in protein target.", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
            
        }
        if lbltargetfat.text == "" {
            
            self.alertController = UIAlertController(title: "Error", message: "Please fill in fat target.", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
            
        }
        if targetcarbohydrate.text == "" {
            
            self.alertController = UIAlertController(title: "Error", message: "Please fill in carboyhydrate target.", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
            
        }
        if lblweight.text == "" {
            self.alertController = UIAlertController(title: "Error", message: "Please fill in weight.", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
        }
        else if lblheightf.text == "" {
                self.alertController = UIAlertController(title: "Error", message: "Please fill in height.", preferredStyle: UIAlertControllerStyle.alert)
                
                
                let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                    print("Ok Button Pressed 1");
                }
                self.alertController!.addAction(OKAction)
                
                self.present(self.alertController!, animated: true, completion:nil)
            }
        else if lblheighti.text == "" {
            self.alertController = UIAlertController(title: "Error", message: "Please fill in height.", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
        }
        else {
            var weight = Int(lblweight.text!)! * 703
            var heightTotalInches = Int(lblheightf.text!)! * 12 + Int(lblheighti.text!)!
            var height = heightTotalInches * heightTotalInches
            var bmi = double_t(weight / height)
            var result = ""
            if bmi < 18{
                result = "Underweight, it is time to eat."
            }
            else if (bmi > 18 && bmi < 25 ) {
                result = "Healthy, but you can always improve."
            }
            else if(bmi>25 && bmi < 29.9 ){
                result = "Obese, but you got this."
            }
            else{
                result = "Overweight, it's not too late."
            }
            
            lblbmi.text = String(bmi) + "-" + result
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
