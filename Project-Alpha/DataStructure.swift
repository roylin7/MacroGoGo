//
//  DataStructure.swift
//  Project-Alpha
//
//  Created by Roy Lin on 11/24/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class datastructure{
    static let shared = datastructure()
    
    private var saveref: DatabaseReference
    
    private init() {
        saveref =  Database.database().reference()
    }
    
}

