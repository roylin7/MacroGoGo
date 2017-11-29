//
//  LogViewController.swift
//  Project-Alpha
//
//  Created by Sheryar Ali on 11/28/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class LogViewController: UIViewController {
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ref = Database.database().reference()
        self.title = "Log View Controller"
        DataStore.shared.loadPeople()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var logName: UITextField!
    
    @IBOutlet weak var logText: UITextView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func saveText(_ sender: Any) {
        let userId = Auth.auth().currentUser?.uid
        print (userId)
        DataStore.shared.exerciseLog(uid: userId!, text: String (describing: logText))
    }
    

}
