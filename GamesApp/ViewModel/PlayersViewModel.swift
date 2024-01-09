//
//  PlayersViewModel.swift
//  GamesApp
//
//  Created by Ketheeswaran Kukesan on 2023-03-14.
//

import Foundation
import UIKit
import FirebaseDatabase

class PlayersViewModel {
    
    var ref: DatabaseReference!

    var players = [Player]()

    var arrayLength : Int = 0

    func getAllData(_ completion: @escaping(_ success : Bool)-> Void){
        ref = Database.database(url : "https://games-939eb-default-rtdb.asia-southeast1.firebasedatabase.app").reference()
        ref.child("PLAYERS").observeSingleEvent(of: .value, with: { snapshot in
            self.players.removeAll()
            if let snapshot = snapshot.value as? Dictionary<String, Any> {
                for snap in snapshot {
                    if let playd = snap.value as? Dictionary<String, Any> {
                        var player = Player(nic: snap.key,
                                            name: playd.first(where: { (key: String, value: Any) in
                            key == "NAME"
                        })!.value as! String ,
                                            age: playd.first(where: { (key: String, value: Any) in
                            key == "AGE"
                        })!.value as! String ,
                                            game: playd.first(where: { (key: String, value: Any) in
                            key == "GAME"
                        })!.value as! String 
                        )
                        print(player)
                        self.players.append(player)
                    }
                }
            }
            completion(true)
        })
    }
}
