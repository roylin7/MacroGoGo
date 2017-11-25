//
//  SignIn.swift
//  Project-Alpha
//
//  Created by Roy Lin on 10/23/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignIn: UIViewController {

    // UI text fields for username and password associated with account
    // to be filled out upon login prompt
    @IBOutlet weak var lblusername: UITextField!
    @IBOutlet weak var lblpw: UITextField!
   
    
    @IBOutlet weak var lblmsg: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // page header
        DataStore.shared.loadPeople()
        self.title = "Sign-In"
        print("username",lblusername.text!)
        print("pw",lblpw.text!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    // select "Login" button to verify account info in datastore
    @IBAction func btnlogin(_ sender: Any) {
        
        let email = String.makeFirebaseString(lblusername.text!)
        if email() == " " || lblpw.text! == " " {
            lblmsg.text = "One or more credentials is missing, please try again!"
            
        }
        
        if DataStore.shared.usernameExist(username: email()){
           let userindex = DataStore.shared.usernameIndex(username: email())
           let person = DataStore.shared.getPerson(index: userindex)
           if person.pw == lblpw.text!{
                lblmsg.text = "Login successful"
                self.performSegue(withIdentifier: "hehe", sender: self)
            
                
                Auth.auth().signIn(withEmail: lblusername.text!, password: lblpw.text!) { (user, error) in
                    if error != nil{
                        print(error)
                        return
                    }
                    let isAnonymous = user!.isAnonymous
                    let uid = user!.uid
                }
           }
           else if person.pw != lblpw.text!{
                lblmsg.text = "One or more credentials is invalid, please try again!!"
           }
        }
        else {
            lblmsg.text = "One or more credentials is invalid, please try again!!!"
        }
        
}
    
    
    
}
