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
    // height in feet
    @IBOutlet weak var lblheightF: UITextField!
    // height in inches
    @IBOutlet weak var lblheightI: UITextField!
    @IBOutlet weak var lblweight: UITextField!
    
    
    
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
        if lblfullname.text == "" {
            
            self.alertController = UIAlertController(title: "Error", message: "Please fill in full name.", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
            
        }
        if lblusername.text == "" {
            
            self.alertController = UIAlertController(title: "Error", message: "Please fill in username.", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
            
        }
        if lblpw.text == "" {
            
            self.alertController = UIAlertController(title: "Error", message: "Please fill in password.", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
            
        }
        if lblweight.text == "" {
            
            self.alertController = UIAlertController(title: "Error", message: "Please fill in weight (lbs).", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
            
        }
        if lblsex.text == "" {
            
            self.alertController = UIAlertController(title: "Error", message: "Please fill in sex either M or F.", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
            
        }
        if lblheightF.text == "" {
            
            self.alertController = UIAlertController(title: "Error", message: "Please fill in height in feet.", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
            
        }
        if lblheightI.text == "" {
            
            self.alertController = UIAlertController(title: "Error", message: "Please fill in height in inches.", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
            
        }
        
        self.alertController = UIAlertController(title: "", message: "Registration Complete!", preferredStyle: UIAlertControllerStyle.alert)
        
        
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
            print("Ok Button Pressed 1");
        }
        self.alertController!.addAction(OKAction)
        let email = String.makeFirebaseString(lblusername.text!)
        self.present(self.alertController!, animated: true, completion:nil)
        let person = Person(username:email() , fullname: lblfullname.text!, pw: lblpw.text!, sex: lblsex.text!, heightF: lblheightF.text!, heightI: lblheightI.text!, weight: lblweight.text!)
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



