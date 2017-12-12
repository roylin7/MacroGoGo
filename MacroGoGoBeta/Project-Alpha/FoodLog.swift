//
//  FoodLog.swift
//  Project-Alpha
//
//  Created by Roy Lin on 11/18/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//
import Foundation

class FoodLog{
    
    // attributes for meal entry object
    
    var uid : String
    var date : String
    var foodname : String
    var carb : String
    var fat : String
    var protein : String
    var selectDate: String
    
    // define constructor
    init(uid: String, date: String, foodname: String, carb: String, fat: String , protein: String, selectDate: String) {
        self.uid = uid
        self.date = date
        self.foodname = foodname
        self.carb = carb
        self.fat = fat
        self.protein = protein
        self.selectDate = selectDate
    }
}
