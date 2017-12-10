//
//  DataModel.swift
//  TestCoreDataSwift
//
//  Created by Robert Seitsinger on 9/29/15.
//  Copyright © 2015 cs378. All rights reserved.
//

import Foundation

class DataModel {
    
    fileprivate var list:[Person] = [Person]()

    init() {
        // Create the list of people
        list.append(Person(name: "Joe", age: 35))
        list.append(Person(name: "Sally", age: 17))
        list.append(Person(name: "Sam", age: 70))
        list.append(Person(name: "Zoey", age: 23))
        list.append(Person(name: "Rider", age: 47))
    }
    
    func count() -> Int {
        return list.count
    }
    
    func get(index:Int) -> Person {
        if index < list.count {
            return list[index]
        } else {
            return Person(name: "<bad>", age: 0)
        }
    }
    
    func add(person:Person) {
        list.append(person)
    }
    
    func delete(index:Int) {
        if index < list.count {
            list.remove(at: index)
        }
    }
}
