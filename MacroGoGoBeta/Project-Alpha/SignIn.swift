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

class SignIn: UIViewController, UITextFieldDelegate {

    // UI text fields for username and password associated with account
    // to be filled out upon login prompt
    @IBOutlet weak var lblusername: UITextField!
    @IBOutlet weak var lblpw: UITextField!
    @IBOutlet weak var signinbtn: UIButton!
    
    @IBOutlet weak var lblmsg: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // page header
        DataStore.shared.loadPeople()
        self.title = "Sign-In"
        lblusername.delegate = self
        lblpw.delegate = self

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
                lblmsg.text = "One or more credentials is invalid, please try again!"
           }
        }
        else {
            lblmsg.text = "One or more credentials is invalid, please try again!"
        }
    }
    
    // text field dismiss method
    // called when user touches return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 'First Responder' is the same as 'input focus'.
        // We are removing input focus from the text field.
        textField.resignFirstResponder()
        return true
    }
    
    // Called when user touches main view (outside the UITextField).
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
