//
//  Info.swift
//  Project-Alpha
//
//  Created by Roy Lin on 11/28/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//

import Foundation

class Info {
    var uid : String
    var heightF: String
    var heightI: String
    var weight : String
    var tfat : String
    var tcarb : String
    var tprotein : String
    
    init(uid:String, heightF:String, heightI:String , weight: String, tfat: String, tcarb:String, tprotein : String){
        self.uid = uid
        self.heightF = heightF
        self.heightI = heightI
        self.weight = weight
        self.tfat = tfat
        self.tcarb = tcarb
        self.tprotein = tprotein
    }
}
