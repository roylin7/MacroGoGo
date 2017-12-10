//
//  MyTableViewController.swift
//  TestCoreDataSwift
//
//  Created by Robert Seitsinger on 9/29/15.
//  Copyright © 2015 cs378. All rights reserved.
//

import UIKit
import CoreData

class MyTableViewController: UITableViewController {

    var nameTextField: UITextField? = nil
    var ageTextField: UITextField? = nil
    let reuseIdentifier = "cellid"
    
   // Our custom data model, using the Person class
//    var data = DataModel()
    
    // Core Data object
    // Holds instances of NSManagedObject rather than our Person class objects
    var people = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the nav bar title
        self.title = "Core Data Demo"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Person")
        
        //
        var fetchedResults:[NSManagedObject]? = nil
        
        do {
            try fetchedResults = managedContext.fetch(fetchRequest) as? [NSManagedObject]
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        if let results = fetchedResults {
            people = results
        } else {
            print("Could not fetch")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.data.count() // For when using the DataModel object.
        return self.people.count
    }

    // This method is called when the user touches the Save button
    @IBAction func btnAddAction(_ sender: AnyObject) {

        let alert = UIAlertController(title: "New Person",
            message: "Add a new Person",
            preferredStyle: .alert)

        // Standard version of the saveAction
//        let saveAction = UIAlertAction(title: "Save",
//            style: .Default) { (action: UIAlertAction!) -> Void in
//                
//                let nameTextField = alert.textFields![0]
//                let ageTextField = alert.textFields![1]
//                self.data.add(person: Person(name: nameTextField.text!, age: Int(ageTextField.text!)!))
//                self.tableView.reloadData()  // causes the table data source methods to execute
//        }
        
        // Core Data version of the saveAction
        let saveAction = UIAlertAction(title: "Save",
            style: .default) { (action: UIAlertAction!) -> Void in
                
                let nameTextField = alert.textFields![0]
                let ageTextField = alert.textFields![1]
                self.savePerson(nameTextField.text!, age: ageTextField.text!)
                self.tableView.reloadData()  // causes the table data source methods to execute
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
            style: .default) { (action: UIAlertAction!) -> Void in
        }
        
        alert.addTextField { (textField) -> Void in
            self.nameTextField = textField
            self.nameTextField?.placeholder = "Name"
        }
        alert.addTextField { (textField) -> Void in
            self.ageTextField = textField
            self.ageTextField?.placeholder = "Age"
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert,
            animated: true,
            completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)

        ////////////////////////////////////////////////////////
        // Get the data from our DataModel object
        //let person = self.data.get(index: indexPath.row)
        
//        cell.textLabel!.text! = person.name
//        cell.detailTextLabel!.text! = String(person.age)
        
        ////////////////////////////////////////////////////////
        // Get the data from Core Data
        let person = people[indexPath.row]
        
        cell.textLabel!.text = person.value(forKey: "name") as? String
        cell.detailTextLabel!.text = String((person.value(forKey: "age") as? Int)!)

        return cell
    }

    func savePerson(_ name: String, age: String) {

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        // Create the entity we want to save
        let entity =  NSEntityDescription.entity(forEntityName: "Person", in: managedContext)
        
        let person = NSManagedObject(entity: entity!, insertInto:managedContext)
        
        // Set the attribute values
        person.setValue(name, forKey: "name")
        person.setValue(Int(age), forKey: "age")
        
        // Commit the changes.
        do {
            try managedContext.save()
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        // Add the new entity to our array of managed objects
        people.append(person)
    }
    
}





