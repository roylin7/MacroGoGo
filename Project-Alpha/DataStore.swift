//
//  DataStore.swift
//  Project-Alpha
//
//  Created by Roy Lin on 10/26/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class DataStore {
    
    static let shared = DataStore()
    
    private var ref: DatabaseReference
    private var people: [Person]!
    
    private init() {
        // Get a database reference.
        // Needed before we can read/write to/from the firebase
        ref = Database.database().reference()
    }
    
    // return number of users registered in datastore
    func count() -> Int {
        return people.count
    }
    
    // return specific user
    func getPerson(index: Int) -> Person {
        return people[index]
    }
    
    // get list of users by name
    func getUserNameList() -> [String] {
        var usernamelist = [String]()
        let num: Int = DataStore.shared.count()
        var i = 0
        while i < num {
            let person = DataStore.shared.getPerson(index: i)
            usernamelist.append(person.username)
            i += 1
        }
        return usernamelist
    }
    func usernameIndex(username: String) -> Int{
        var usernamelist = DataStore.shared.getUserNameList()
        var i = 0
        var a :Int = 0
        while i < usernamelist.count {
            if usernamelist[i] == username{
                a = i
                return a
                break
            }
            else {
                i += 1
            }
        }
        
        return a
        
    }
    
    func usernameExist(username: String) -> Bool{
        
        var usernamelist = DataStore.shared.getUserNameList()
       
        if usernamelist.contains(username){
            return true
        }
        else{
            return false
        }
        
    }
    func getUsername(username: String) -> String{
        var usernamelist1 = DataStore.shared.getUserNameList()
   
        if usernamelist1.contains(username){
            return username
        }
      
        else{
            return "username not found"
            
            
        }
    }
    
    func updatePassword(username: String, password: String) {
        let place = DataStore.shared.usernameIndex(username: username)
        let person = people[place]
        print(person)
        self.ref.child("people").child(person.username).updateChildValues(["pw":password])
    }
    
    func getPassword(username: String) -> String {
  
        let place = DataStore.shared.usernameIndex(username: username)
        let person = people[place]
        let oldpassword = person.pw
        return oldpassword
    }
    
    
    
    
    
    func loadPeople() {
        // Start with an empty array.
        people = [Person]()
        
        // Fetch the data from Firebase and store it in our internal people array.
        // This is a one-time listener.
        ref.child("people").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get the top-level dictionary.
            let value = snapshot.value as? NSDictionary
            
            if let persons = value {
                // Iterate over the person objects and store in our internal people array.
                for p in persons {
                    let person = p.value as! [String:AnyObject]
                    let username = person["username"]
                    let fName = person["fName"]
                    let pw = person["pw"]
                    let sex = person["sex"]
                    let heightF = person["heightF"]
                    let heightI = person["heightI"]
                    let weight = person["weight"]
                    let newPerson = Person(username: username! as! String, fullname: fName! as! String, pw: pw! as! String,sex: sex! as! String)
                    self.people.append(newPerson)
                }
            }
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func addPerson(person: Person) {
        // define array of key/value pairs to store for this person.
        let personRecord = [
            "username": person.username,
            "fName": person.fullname,
            "pw": person.pw,
            "sex": person.sex,
           
        ]
        
        // Save to Firebase.
        self.ref.child("people").child(person.username).setValue(personRecord)
        
        // Also save to our internal array, to stay in sync with what's in Firebase.
        people.append(person)
    }
    
}

