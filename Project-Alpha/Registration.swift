//
//  Registration.swift
//  Project-Alpha
//
//  Created by Roy Lin on 10/23/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//

import UIKit

class Registration: UIViewController {

    // UI text fields for user specs
    // to be filled out upon registration prompt
    //
    // account info
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
        let person = Person(username: lblusername.text!, fullname: lblfullname.text!, pw: lblpw.text!, sex: lblsex.text!, heightF: lblheightF.text!, heightI: lblheightI.text!, weight: lblweight.text!)
        // store Person object in datastore 
        DataStore.shared.addPerson(person: person)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
