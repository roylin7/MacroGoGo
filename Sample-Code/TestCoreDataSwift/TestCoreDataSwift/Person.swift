//
//  Person.swift
//  TestCoreDataSwift
//
//  Created by Robert Seitsinger on 9/29/15.
//  Copyright © 2015 cs378. All rights reserved.
//

import Foundation

class Person {
    
    fileprivate var _name:String = ""
    fileprivate var _age:Int = 0
    
    var name:String {
        get {
            return _name
        }
        set (newValue) {
            _name = newValue
        }
    }
    var age:Int {
        get {
            return _age
        }
        set(newVal) {
            _age = newVal
        }
    }

    init(name:String, age:Int) {
        self.name = name
        self.age = age
    }

    convenience init() {
        self.init(name:"<NoName>", age:0)
    }
    
    func description() -> String {
        return "Name: \(name), Age: \(age)"
    }
}
