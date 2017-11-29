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
    var alertController:UIAlertController? = nil
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
        let uid = Auth.auth().currentUser?.uid
        if logName.text! == "" && logText.text! == "" {
            self.alertController = UIAlertController(title: "Error", message: "Please fill in Logname and Text'", preferredStyle: UIAlertControllerStyle.alert)
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
        }
        else if logName.text! == "" {
            self.alertController = UIAlertController(title: "Error", message: "Please Complete Logname '", preferredStyle: UIAlertControllerStyle.alert)
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 2");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
        }
        else if logText.text! == "" {
            self.alertController = UIAlertController(title: "Error", message: "Please Complete Text'", preferredStyle: UIAlertControllerStyle.alert)
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 3");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
        }
        
        else {
            let elog = Execriselog(uid: uid!, logname: logName.text!, log: logText.text!)
            DataStore.shared.addELog(elog: elog)
            self.alertController = UIAlertController(title: "Thank You", message: "Saved", preferredStyle: UIAlertControllerStyle.alert)
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
                print("Ok Button Pressed 1");
            }
            self.alertController!.addAction(OKAction)
            
            self.present(self.alertController!, animated: true, completion:nil)
        }
        
        
        
        
    }
    

}
