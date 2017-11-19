//
//  Setting.swift
//  Project-Alpha
//
//  Created by Roy Lin on 10/31/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//

import UIKit

class Setting: UIViewController {
    var alertController:UIAlertController? = nil
    @IBOutlet weak var lbltargetfat: UITextField!
    @IBOutlet weak var lbltargetpotein: UITextField!
    @IBOutlet weak var targetcarbohydrate: UITextField!
    @IBOutlet weak var lblpw: UITextField!
    @IBOutlet weak var lblpwagain: UITextField!
    @IBOutlet weak var lblbmi: UILabel!
    @IBOutlet weak var lblheight: UITextField!
    @IBOutlet weak var lblweight: UITextField!
    
    @IBAction func BMIindex(_ sender: Any) {
        if lblweight.text == "" {
            self.alertController = UIAlertController(title: "Error", message: "Please fill in weight.", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
        }
        else if lblheight.text == "" {
                self.alertController = UIAlertController(title: "Error", message: "Please fill in height.", preferredStyle: UIAlertControllerStyle.alert)
                
                
                let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                    print("Ok Button Pressed 1");
                }
                self.alertController!.addAction(OKAction)
                
                self.present(self.alertController!, animated: true, completion:nil)
            }
        else {
            var weight = Int(lblweight.text!)! * 703
            var height = Int(lblheight.text!)! ^ 2
            var bmi = weight / height
            lblbmi.text = String(bmi)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
