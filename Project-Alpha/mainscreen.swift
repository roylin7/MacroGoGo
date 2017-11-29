//
//  MainScreen.swift
//  Project-Alpha
//
//  Created by Roy Lin on 11/20/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//

import UIKit
import FirebaseAuth

class MainScreen: UIViewController {
    var alertController:UIAlertController? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        DataStore.shared.loadElog()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logout(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    
        self.performSegue(withIdentifier: "home", sender: self)
        self.alertController = UIAlertController(title: "", message: "Logged Out Sucessfully!", preferredStyle: UIAlertControllerStyle.alert)
        
        
        
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
            
            print("Ok Button Pressed 1");
            
        }
        
        self.alertController!.addAction(OKAction)
        
        self.present(self.alertController!, animated: true, completion:nil)
        
    }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    


