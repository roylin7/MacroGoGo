//
//  Person.swift
//  Project-Alpha
//
//  Created by Roy Lin on 10/26/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//

import Foundation

class Person {
    
    // Person class to create object upon user registration
    // class attributes
    var username: String
    var fullname: String
    var pw: String
    var sex: String
    var heightF: String
    var heightI: String
    var weight : String
    //var tfat : String
    //var tcarb : String
    //var tprotein : String
    
    // constructor defined
    init(username: String, fullname: String, pw: String,sex:String, heightF: String, heightI: String , weight: String) {
        self.username = username
        self.fullname = fullname
        self.pw = pw
        self.sex = sex
        self.heightF = heightF
        self.heightI = heightI
        self.weight = weight
        //self.tfat = tfat
        //self.tcarb = tcarb
        //self.tprotein = tprotein
    }
    
}
