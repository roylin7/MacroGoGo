//
//  mainscreen.swift
//  Project-Alpha
//
//  Created by Roy Lin on 11/20/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//

import UIKit

class mainscreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Home"
        print("ViewController1: viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewController1: viewWillAppear")
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
