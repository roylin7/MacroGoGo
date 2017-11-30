//
//  Exerciselog.swift
//  Project-Alpha
//
//  Created by Roy Lin on 11/29/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//

import Foundation
class Execriselog{
    var logname : String
    var log : String
    var uid : String
    
    init(uid:String, logname: String, log: String){
        self.uid = uid
        self.logname = logname
        self.log = log
    }
}
