//
//  Sign-In.swift
//  Project-Alpha
//
//  Created by Roy Lin on 10/23/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//

import UIKit

class Sign_In: UIViewController {

    // UI text fields for username and password associated with account
    // to be filled out upon login prompt
    @IBOutlet weak var lblusername: UITextField!
    @IBOutlet weak var lblpw: UITextField!
    
    
    @IBOutlet weak var lblmsg: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // page header
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
        if lblusername.text!.isEmpty || lblpw.text!.isEmpty {
            lblmsg.text = "Username/pw is empty, try again"
        }
        
        if DataStore.shared.usernameExist(username: lblusername.text!){
           let userindex = DataStore.shared.usernameIndex(username: lblusername.text!)
           let person = DataStore.shared.getPerson(index: userindex)
           if person.pw == lblpw.text!{
                lblmsg.text = "log in successfully"
           }
           else if person.pw != lblmsg.text!{
                lblmsg.text = "Username/pw wrong, try again"
           }
        }
        else {
            lblmsg.text = "Username/pw wrong, try again"
        }
}
    
}
