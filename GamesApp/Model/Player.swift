//
//  Player.swift
//  GamesApp
//
//  Created by Ketheeswaran Kukesan on 2023-03-01.
//

import Foundation
import UIKit

struct Captain {
    let name : String
    let ageCategory : AgeCatergory
    let city : String
}

enum AgeCatergory{
    case under19
    case under23
    case under27
}

//class Player : NSObject {
//    var nic : String = ""
//    var name : String = ""
//    var age : String = ""
//
//    init(nic : String , playerData : Dictionary<String,Any>) {
//        self.nic = nic
//
//        if let name = playerData["name"] as? String {
//            self.name = name
//        }
//
//        if let age = playerData["age"] as? String {
//            self.age = age
//        }
//    }
//}

class Player {
    let nic : String
    let name : String
    let age : String
    let game : String
    
    internal init(nic : String , name : String , age : String, game : String) {
        self.nic = nic
        self.name = name
        self.age = age
        self.game = game
    }
}
