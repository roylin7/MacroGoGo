//
//  Registration.swift
//  Project-Alpha
//
//  Created by Roy Lin on 10/23/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//

import UIKit
import FirebaseAuth

class Registration: UIViewController {

    // UI text fields for user specs
    // to be filled out upon registration prompt
    //
    // account info
    var alertController:UIAlertController? = nil
    @IBOutlet weak var lblfullname: UITextField!
    @IBOutlet weak var lblusername: UITextField!
    @IBOutlet weak var lblpw: UITextField!
    
    // user fitness specs
    @IBOutlet weak var lblsex: UITextField!

    
    func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", ".{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // page header
        self.title = "Registration"
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnsignup(_ sender: Any) {
        // select "Sign Up" button to save registration info
        // create Person object for user subsequently
        if lblfullname.text == "" && lblusername.text == "" && lblpw.text == "" && lblsex.text == ""  {
            
            self.alertController = UIAlertController(title: "Error", message: "Please enter your information.", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
        }
        if lblfullname.text == "" {
            
            self.alertController = UIAlertController(title: "Error", message: "Please complete 'Full Name'", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
            
        }
        if lblusername.text == "" {
            
            self.alertController = UIAlertController(title: "Error", message: "Please complete 'Username'", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
            
        }
        if lblpw.text == "" {
            
            self.alertController = UIAlertController(title: "Error", message: "Please complete 'Password'", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
            
        }
        else
        {
            let s = lblpw.text
            if(isPasswordValid(s!)) == false{
                self.alertController = UIAlertController(title: "Error", message: "Please choose a password with at least 8 characters", preferredStyle: UIAlertControllerStyle.alert)
                
                
                let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                    print("Ok Button Pressed 1");
                }
                self.alertController!.addAction(OKAction)
                
                self.present(self.alertController!, animated: true, completion:nil)
            }
            
        }

        if lblsex.text == "" {
            
            self.alertController = UIAlertController(title: "Error", message: "Please complete 'Sex' (M/F)", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
            
        }

        
        self.alertController = UIAlertController(title: "", message: "Registration Complete! Please Log-In", preferredStyle: UIAlertControllerStyle.alert)
        
        
        self.performSegue(withIdentifier: "back", sender: self)
        
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
            print("Ok Button Pressed 1");
        }
        self.alertController!.addAction(OKAction)
        self.present(self.alertController!, animated: true, completion:nil)
        
        
        let email = String.makeFirebaseString(lblusername.text!)

        let person = Person(username:email() , fullname: lblfullname.text!, pw: lblpw.text!, sex: lblsex.text!)

       
        // store Person object in datastore and register user 
        Auth.auth().createUser(withEmail: lblusername.text!, password: person.pw, completion: {(user:User?,error) in
            if error != nil {
                print (error)
                return
            }
            
            DataStore.shared.addPerson(person: person)
        })
       
       
       
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
}



