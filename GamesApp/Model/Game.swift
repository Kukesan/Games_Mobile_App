//
//  Game.swift
//  GamesApp
//
//  Created by Ketheeswaran Kukesan on 2023-03-01.
//

import Foundation
import UIKit

class Game{
    let name : GameName
    let noOfPlayers : Int
    var isVacancy : Bool 
    let captain : Captain
    
    internal init(name: GameName, noOfPlayers: Int, isVacancy: Bool = false, captain: Captain) {
        self.name = name
        self.noOfPlayers = noOfPlayers
        self.isVacancy = isVacancy
        self.captain = captain
    }
}

enum GameName:String{
    case cricket = "Cricket"
    case football = "Football"
    case netball = "Netball"
    case chess = "Chess"
    case basketball = "Basketball"
}

extension GameName{
    var gamephoto : UIImage {
        switch self {
        case .cricket :
            return UIImage(named : "cricket")!
        case .basketball :
            return UIImage(named : "basketball")!
        case .chess :
            return UIImage(named : "chess")!
        case .football :
            return UIImage(named : "football")!
        case .netball :
            return UIImage(named : "netball")!
        }
    }
}
