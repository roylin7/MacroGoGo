//

//  ResetViewController.swift

//  Project-Alpha

//

//  Created by Sheryar Ali on 11/21/17.

//  Copyright © 2017 Roy Lin. All rights reserved.

//



import UIKit

import Firebase

import FirebaseAuth



class ResetViewController: UIViewController {
    
    var alertController:UIAlertController? = nil
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
        
    }
    
    @IBOutlet weak var username: UITextField!

    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var newPassword: UITextField!
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }

    @IBAction func resetButton(_ sender: Any) {
        
        if username.text == "" && password.text == "" && newPassword.text == "" {
            
            self.alertController = UIAlertController(title: "Error", message: "Please enter your information.", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                
                print("Ok Button Pressed 1");
                
            }
            
            self.alertController!.addAction(OKAction)
            self.present(self.alertController!, animated: true, completion:nil)
        }
        
        if username.text == "" {
            
            self.alertController = UIAlertController(title: "Error", message: "Please enter your username.", preferredStyle: UIAlertControllerStyle.alert)
                let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                
                print("Ok Button Pressed 1");
                
            }
            
            self.alertController!.addAction(OKAction)
        
            self.present(self.alertController!, animated: true, completion:nil)
        }
        if password.text == "" {
            
            self.alertController = UIAlertController(title: "Error", message: "Please enter your old password.", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                
                print("Ok Button Pressed 1");
                
            }
            self.alertController!.addAction(OKAction)
            self.present(self.alertController!, animated: true, completion:nil)
            
        }
            
        else if newPassword.text == "" {
            
            self.alertController = UIAlertController(title: "Error", message: "Please enter your new password.", preferredStyle: UIAlertControllerStyle.alert)
                let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            
            self.alertController!.addAction(OKAction)
            self.present(self.alertController!, animated: true, completion:nil)
        }
            
        else {
            
            let newString = username.text?.replacingOccurrences(of: ".", with: " ")
            
            let username1 = DataStore.shared.getUsername(username: newString!)
            
            let oldpw = DataStore.shared.getPassword(username: username1)
            
           
            
            
            
            if password.text == oldpw {
            
            DataStore.shared.updatePassword(username: username1, password: newPassword.text!)
            
            }
            
        }
        
        
        
        
        
    }
    
}






