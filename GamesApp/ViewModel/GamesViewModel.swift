//
//  GamesViewModel.swift
//  GamesApp
//
//  Created by Ketheeswaran Kukesan on 2023-03-01.
//

import Foundation

class GamesViewModel{
    private(set) var games:[Game] = [
        Game(name: .cricket,
             noOfPlayers: 11,
             captain: .init(name: "Kamal", ageCategory: .under19, city: "Colombo")
             ),
        Game(name: .football,
             noOfPlayers: 11,
             captain: .init(name: "John", ageCategory: .under27, city: "Jaffna")
             ),
        Game(name: .chess,
             noOfPlayers: 2,
             captain: .init(name: "Perara", ageCategory: .under23, city: "Kandy")
             ),
        Game(name: .netball,
             noOfPlayers: 7,
             captain: .init(name: "Malini", ageCategory: .under19, city: "Vavuniya")
             ),
        Game(name: .basketball,
             noOfPlayers: 8,
             captain: .init(name: "Thusara", ageCategory: .under23, city: "Galle")
             )
    ]
    func visible(for game:Game){
        games.forEach{item in
            if item.name == game.name {
                item.isVacancy.toggle()
            }else{
                item.isVacancy = false 
            }
        }
    }
}
