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
import FirebaseAuth


class DataStore {
    
    static let shared = DataStore()
    
    private var ref: DatabaseReference
    private var people: [Person]!
    private var foodlogs:[FoodLog]!
    private var Elog:[Execriselog]!
    
    private init() {
        // Get a database reference.
        // Needed before we can read/write to/from the firebase
        ref = Database.database().reference()
    }
    
    // return number of users registered in datastore
    func count() -> Int {
        return people.count
    }
    
    func Ecount() -> Int {
        return Elog.count
    }
    
    // return specific user
    func getPerson(index: Int) -> Person {
        return people[index]
    }
    func getElog(index: Int) -> Execriselog {
        return Elog[index]
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
        self.ref.child("people").child(person.uid).updateChildValues(["pw":password])
        Auth.auth().signIn(withEmail: username, password: password) { (user, error) in
            if error != nil{
                print(error)
                return
            }
        }
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
                    let uid = person["uid"]
                    let username = person["username"]
                    let fName = person["fName"]
                    let pw = person["pw"]
                    let sex = person["sex"]
                    
                    let newPerson = Person(uid:uid! as! String ,username: username! as! String, fullname: fName! as! String, pw: pw! as! String,sex: sex! as! String)

                    self.people.append(newPerson)
                }
            }
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func loadFoodlog(){
        foodlogs = [FoodLog]()
        ref.child("foodlog").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get the top-level dictionary.
            let value = snapshot.value as? NSDictionary
            
            if let foodlogs = value {
                // Iterate over the person objects and store in our internal people array.
                for f in foodlogs {
                    let foodlogs = f.value as! [String:String]
                    let uid = foodlogs["uid"]
                    let date = foodlogs["date"]
                    let foodname = foodlogs["foodname"]
                    let carb = foodlogs["carb"]
                    let fat = foodlogs["fat"]
                    let protein = foodlogs["protein"]
                    
                    let newfoodlog = FoodLog(uid: uid!, date:date!,foodname:
                        foodname!, carb: carb!, fat: fat!, protein: protein!)
                    
                    self.foodlogs.append(newfoodlog)
                   
                }
            }
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    func loadElog(){
        Elog = [Execriselog]()
        let uid = Auth.auth().currentUser?.uid
        print(uid)
        ref.child("elog").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get the top-level dictionary.
            let value = snapshot.value as? NSDictionary
            
            if let elogs = value {
                // Iterate over the person objects and store in our internal people array.
                for e in elogs {
                    let elog = e.value as! [String:String]
                    let uid = elog["uid"]
                    let log = elog["log"]
                    let logName = elog["logname"]
                    
                    
                    let newElog = Execriselog(uid: uid!, logname: logName!, log: log!)
                    
                    self.Elog.append(newElog)
                    
                }
            }
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    
    func addPerson(person: Person) {
        // define array of key/value pairs to store for this person.
        let personRecord = [
            "uid" : person.uid,
            "username": person.username,
            "fName": person.fullname,
            "pw": person.pw,
            "sex": person.sex,
        ]
        
        // Save to Firebase.
        self.ref.child("people").child(person.uid).setValue(personRecord)
        self.ref.child("setting").child(person.uid).setValue("")
        self.ref.child("elog").child(person.uid).setValue("")
        self.ref.child("foodlog").child(person.uid).setValue("")
        
        // Also save to our internal array, to stay in sync with what's in Firebase.
        people.append(person)
    }
    
    
    func addFoodlog(foodlog : FoodLog){
        let foodlogRecord = [
            "uid": foodlog.uid,
            "date":foodlog.date,
            "foodname":foodlog.foodname,
            "carb": foodlog.carb,
            "fat": foodlog.fat,
            "protein":foodlog.protein
        ]
        self.ref.child("foodlog").child(foodlog.uid).child(foodlog.date).child(foodlog.foodname).setValue(foodlogRecord)
        
        
    }
    func setSetting(info: infoSetting){
        let settingRecord = [
            "uid" : info.uid,
            "heightF" : info.heightF,
            "heightI" : info.heightI,
            "weight": info.weight,
            "tfat": info.tfat,
            "tcarb": info.tcarb,
            "tprotein": info.tprotein
        ]
        self.ref.child("setting").child(info.uid).setValue(settingRecord)
    }
    
    func addELog(elog: Execriselog){
        let elogRecord = [
            "uid": elog.uid,
            "logname": elog.logname,
            "log": elog.log
        ]
        self.ref.child("elog").child(elog.uid).child(elog.logname).setValue(elogRecord)
        
    }
    
    
    
    

   
    

    
}

