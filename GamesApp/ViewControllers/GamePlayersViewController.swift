//
//  GamePlayersViewController.swift
//  GamesApp
//
//  Created by Ketheeswaran Kukesan on 2023-03-30.
//

import Foundation
import UIKit
import FirebaseDatabase

class GamePlayersViewController: UIViewController {
    
    var gameName : String = ""
    
    var playersname = [String]()
    
    var ref: DatabaseReference!
    
    init(gameName : String){
        super.init(nibName: nil, bundle: nil)
        self.gameName = gameName
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        super.loadView()
        configure()
        self.getGamePlayers{ (success) -> Void in
            if success{
                self.gamePlayersList.text = self.playersname.joined(separator: "\n")
                self.gamePlayersList.numberOfLines = self.playersname.count + 1
                self.gamePlayersList.lineBreakMode = NSLineBreakMode.byWordWrapping
            }
        }
    }
    
    private lazy var backButton : UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var nameList : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "\(gameName) Game Players"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private lazy var gamePlayersList : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 5
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.brown.cgColor
        label.textColor = .black
        return label
    }()
        
    func configure(){
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
        self.view.addSubview(backButton)
        self.view.addSubview(nameList)
        self.view.addSubview(gamePlayersList)
        
        NSLayoutConstraint.activate([
            
            backButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            backButton.heightAnchor.constraint(equalToConstant: 10),
            
            nameList.topAnchor.constraint(equalTo: self.backButton.topAnchor,constant: 16),
            nameList.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 8),
            nameList.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -8),
            
            gamePlayersList.topAnchor.constraint(equalTo: nameList.bottomAnchor,constant: 8),
            gamePlayersList.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 8),
            gamePlayersList.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -8),
            
        ])
    }
    
    @objc func goBack(){
        self.dismiss(animated: false, completion: nil)
    }
    
    func getGamePlayers(completion:@escaping (_ success: Bool) -> Void){
        ref = Database.database(url : "https://games-939eb-default-rtdb.asia-southeast1.firebasedatabase.app").reference()
        ref.child("PLAYERS").observeSingleEvent(of: .value, with: { snapshot in
            if let snapshot = snapshot.value as? Dictionary<String, Any> {
                for snap in snapshot {
                    if let playd = snap.value as? Dictionary<String, Any> {
                        if(playd.first(where: { (key: String, value: Any) in
                            key == "GAME"
                        })!.value as! String == self.gameName){
                            let name : String = playd.first(where: { (key: String, value: Any) in
                                key == "NAME"
                            })!.value as! String
//                            self.gamePlayersList.text = name
                            self.playersname.append(name)
                          
                        }
                    }
                }
            }
            completion(true)
        })
    }
    
}
