//
//  MyTabBarController.swift
//  Project-Alpha
//
//  Created by Sheryar Ali on 11/21/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.tabBar.isTranslucent = false
        
        self.createTabs()
    }
    
    fileprivate func createTabs() {
        let storyboard = UIStoryboard(name: "Main", bundle:nil)
        
        let vc1 = storyboard.instantiateViewController(withIdentifier: "vc1") as? MainScreen
        let vc2 = storyboard.instantiateViewController(withIdentifier: "vc2") as? Settings
        
        // Get each tab's image from the Assets.xcassets file.
        let image1 = UIImage(named: "tab1")
        let image2 = UIImage(named: "tab2")
        
        
        // Set each tab's item attributes.
        vc1!.tabBarItem = UITabBarItem(
            title: "Tab 1",
            image: image1,
            tag: 1)
        vc2!.tabBarItem = UITabBarItem(
            title: "Tab 2",
            image: image2,
            tag: 2)
    
        
        // Wrap the view controllers in their own nav controllers.
        let nc1 = UINavigationController(rootViewController: vc1!)
        let nc2 = UINavigationController(rootViewController: vc2!)
        
        
        // Create the array of controllers that make up the tab bar items.
        let controllers:[UIViewController] = [nc1, nc2]
        self.viewControllers = controllers
    }
}

extension MyTabBarController: UITabBarControllerDelegate {
    // Indicates which tab bar item was tapped.
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("====>>>   didSelectItem. item.tag = \(item.tag)")
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

