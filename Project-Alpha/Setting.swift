//
//  Setting.swift
//  Project-Alpha
//
//  Created by Roy Lin on 10/31/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class Setting: UIViewController, UITextFieldDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Settings"
        print("ViewController1: viewDidLoad")
        lblheightf.delegate = self
        lblweight.delegate = self
        lbltargetfat.delegate = self
        targetcarbohydrate.delegate = self
        lbltargetpotein.delegate = self
        lblheighti.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewController1: viewWillAppear")
    }
    var alertController:UIAlertController? = nil
    @IBOutlet weak var lbltargetfat: UITextField!
    @IBOutlet weak var lbltargetpotein: UITextField!
    @IBOutlet weak var targetcarbohydrate: UITextField!

    
    @IBOutlet weak var lblbmi: UILabel!
    @IBOutlet weak var lblheightf: UITextField!
    @IBOutlet weak var lblheighti: UITextField!
    @IBOutlet weak var lblweight: UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 'First Responder' is the same as 'input focus'.
        // We are removing input focus from the text field.
        textField.resignFirstResponder()
        return true
    }
    
    // Called when the user touches on the main view (outside the UITextField).
    //
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @IBAction func saveButton(_ sender: Any) {
    
    
        if lbltargetfat.text == "" && lbltargetpotein.text == "" && targetcarbohydrate.text == "" && lblheightf.text == "" && lblheighti.text == "" && lblweight.text == "" {
            
            self.alertController = UIAlertController(title: "Error", message: "Please enter your information", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
        }
        if lbltargetpotein.text == "" {
            
            self.alertController = UIAlertController(title: "Error", message: "Please complete 'Protein Target'", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
            
        }
        if lbltargetfat.text == "" {
            
            self.alertController = UIAlertController(title: "Error", message: "Please complete 'Fat Target'", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
            
        }
        if targetcarbohydrate.text == "" {
            
            self.alertController = UIAlertController(title: "Error", message: "Please complete 'Carboyhydrate Target'", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
            
        }
        if lblweight.text == "" {
            self.alertController = UIAlertController(title: "Error", message: "Please complete 'Weight'", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
        }
        if lblheightf.text == "" {
            self.alertController = UIAlertController(title: "Error", message: "Please complete 'Height'", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
        }
        if lblheighti.text == "" {
            self.alertController = UIAlertController(title: "Error", message: "Please complete 'Height'", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
        }
        else{
            let usereid = Auth.auth().currentUser?.uid
            let newSetting = infoSetting(uid: usereid!, heightF: lblheightf.text!, heightI: lblheighti.text!, weight: lblweight.text!, tfat: lbltargetfat.text!, tcarb: targetcarbohydrate.text!, tprotein: lbltargetpotein.text!)
            
            DataStore.shared.setSetting(info: newSetting)
            
            
            self.alertController = UIAlertController(title: "Thank You", message: "Your information will be updated and saved.", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
        }
    }
    
    @IBAction func BMIindex(_ sender: Any) {
        if lblweight.text == "" {
            self.alertController = UIAlertController(title: "Error", message: "Please complete 'Weight'", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
        }
        else if lblheightf.text == "" {
                self.alertController = UIAlertController(title: "Error", message: "Please complete 'Height'", preferredStyle: UIAlertControllerStyle.alert)
                
                
                let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                    print("Ok Button Pressed 1");
                }
                self.alertController!.addAction(OKAction)
                
                self.present(self.alertController!, animated: true, completion:nil)
            }
        else if lblheighti.text == "" {
            self.alertController = UIAlertController(title: "Error", message: "Please complete 'Height'", preferredStyle: UIAlertControllerStyle.alert)
            
            
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
                result = "Underweight, but there's room for improvement!"
            }
            else if (bmi > 18 && bmi < 25 ) {
                result = "Healthy BMI!"
            }
            else if(bmi > 25 && bmi < 29.9 ){
                result = "Overweight, but it's not too late!"
            }
            else{
                result = "Obese, but who's counting anyways?!"
            }
            
            lblbmi.text = String(bmi) + "-" + result
        }
        
    }
    
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
