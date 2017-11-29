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
    
    var uid :String
    var year: String
    var month: String
    var day : String
    var foodname : String
    var carb : String
    var fat : String
    var protein : String
    
    // define constructor
    init(uid: String,year: String, month: String, day: String,foodname:String, carb: String, fat: String , protein: String) {
        self.uid = uid
        self.year = year
        self.month = month
        self.day = day
        self.foodname = foodname
        self.carb = carb
        self.fat = fat
        self.protein = protein
}
}
