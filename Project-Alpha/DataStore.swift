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
    private var Elog:[ExerciseLog]!
    
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
    
    func Fcount() -> Int{
        return foodlogs.count
    }
    
    // return specific user
    func getPerson(index: Int) -> Person {
        return people[index]
    }
    func getElog(index: Int) -> ExerciseLog {
        return Elog[index]
    }
    
    func getFoodlog(index: Int) -> FoodLog{
        return foodlogs[index]
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
            return "Username not found in system"
        }
    }
    
    func getDateList(foologs: [FoodLog]) -> [String] {
        var dateList = [String]()
        let num: Int = DataStore.shared.Fcount()
        var i = 0
        while i < num {
            let foodlog = DataStore.shared.getFoodlog(index: i)
            if dateList.contains(getDate(foodlog: foodlog)){
                i += 1
            }
            else{
                dateList.append(getDate(foodlog: foodlog))
                i += 1
            }
            
        }
        return dateList
    }
        
    func getDateListCount() -> Int{
        return self.getDateList(foologs: DataStore.shared.getFoodlogs()).count
    }
    
    func getFoodlogsByDate(date:String) -> [FoodLog]{
        var foodlogbydate = [FoodLog]()
        let num: Int = DataStore.shared.Fcount()
        var i = 0
        while i < num{
            let foodlog = DataStore.shared.getFoodlog(index:num)
            if getDate(foodlog: foodlog) == date{
                foodlogbydate.append(foodlog)
                i += 1
            }
            else {
                i += 1
            }
        }
        return foodlogbydate
    }
    
    func getFoodlogs() -> [FoodLog]{
        return foodlogs
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
    
    func getDate(foodlog: FoodLog) -> String{
        let date = foodlog.date
        let index =  date.index(date.startIndex, offsetBy: 11)
        let substring = date[..<index]
        return String(substring)
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
        let uid = Auth.auth().currentUser?.uid
        ref.child("foodlog").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get the top-level dictionary.
            let value = snapshot.value as? NSDictionary
            
            if let foodlog = value {
                for f in foodlog{
                    let fl = f.value as! [String:String]
                    let uid = fl["uid"]
                    let date = fl["date"]
                    let foodname = fl["foodname"]
                    let carb = fl["carb"]
                    let protein = fl["protein"]
                    let fat = fl["fat"]
                    
                    let newfoodlog = FoodLog(uid: uid!, date: date!, foodname: foodname!, carb: carb!, fat: fat!, protein: protein!)
                    
                    self.foodlogs.append(newfoodlog)
                }
            }
            
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    func loadElog(){
        Elog = [ExerciseLog]()
        let uid = Auth.auth().currentUser?.uid
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
                    
                    
                    let newElog = ExerciseLog(uid: uid!, logname: logName!, log: log!)
                    
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
        self.ref.child("foodlog").child(foodlog.uid).child(foodlog.date).setValue(foodlogRecord)
        
        
    }
    func setSetting(info: InfoSetting){
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
    
    func addELog(elog: ExerciseLog){
        let elogRecord = [
            "uid": elog.uid,
            "logname": elog.logname,
            "log": elog.log
        ]
        self.ref.child("elog").child(elog.uid).child(elog.logname).setValue(elogRecord)
        
    }
    
    
    
    

   
    

    
}

