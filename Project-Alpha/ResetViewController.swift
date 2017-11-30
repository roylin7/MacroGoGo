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

    }
    
    @IBOutlet weak var username: UITextField!

    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var newPassword: UITextField!
    
    var bool = false
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
    func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", ".{8,}")
        return passwordTest.evaluate(with: password)
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
            
            self.alertController = UIAlertController(title: "Error", message: "Please enter a new password.", preferredStyle: UIAlertControllerStyle.alert)
                let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            
            self.alertController!.addAction(OKAction)
            self.present(self.alertController!, animated: true, completion:nil)
        }
            
        else if(isPasswordValid(newPassword.text!) == false) {
                self.alertController = UIAlertController(title: "Error", message: "Please choose a new password with at least 8 characters", preferredStyle: UIAlertControllerStyle.alert)
                
                
                let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                    print("Ok Button Pressed 1");
                }
                self.alertController!.addAction(OKAction)
                
                self.present(self.alertController!, animated: true, completion:nil)
            }
            else{
                let newString = username.text?.replacingOccurrences(of: ".", with: " ")
                if(DataStore.shared.usernameExist(username: newString!)){
                let username1 = DataStore.shared.getUsername(username: newString!)
                let oldpw = DataStore.shared.getPassword(username: username1)
                if password.text == oldpw {
                    DataStore.shared.updatePassword(username: username1, password: newPassword.text!)
                    bool = true
                }
                else{
                    self.alertController = UIAlertController(title: "Error", message: "Please re-enter your old password correctly.", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                        print("Ok Button Pressed 1");
                    }
                    
                    self.alertController!.addAction(OKAction)
                    self.present(self.alertController!, animated: true, completion:nil)
                }
                }
            else{
                self.alertController = UIAlertController(title: "Error", message: "Username doesn't exist in system", preferredStyle: UIAlertControllerStyle.alert)
                
                let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                    
                    print("Ok Button Pressed 1");
                    
                }
            
                self.alertController!.addAction(OKAction)
        
                self.present(self.alertController!, animated: true, completion:nil)
            }
            
        }
        if bool {
            self.performSegue(withIdentifier: "ss", sender: self)
            self.alertController = UIAlertController(title: "", message: "Password has been changed and updated!", preferredStyle: UIAlertControllerStyle.alert)
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                
                print("Ok Button Pressed 1");
                
            }
            
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
        }
    }
}
    







