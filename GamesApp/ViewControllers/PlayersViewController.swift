//
//  PlayersViewController.swift
//  GamesApp
//
//  Created by Ketheeswaran Kukesan on 2023-03-09.
//

import UIKit
import FirebaseDatabase

class PlayersViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    private lazy var playersviewmodel = PlayersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        configure()
        configData()
    }
    
    private lazy var backBtn : UIButton = {
        let backbtn = UIButton()
        backbtn.setTitle("Back", for: .normal)
        backbtn.setTitleColor(.white, for: .normal)
        backbtn.translatesAutoresizingMaskIntoConstraints = false
        return backbtn
    }()
    
    private lazy var headlbl : UILabel = {
        let namelist =  UILabel()
        namelist.translatesAutoresizingMaskIntoConstraints = false
        namelist.textColor = .white
        namelist.textAlignment = .center
        namelist.text = "All Players"
        return namelist
    }()
    
    private lazy var tableview: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.rowHeight = UITableView.automaticDimension
        tv.separatorStyle = .none
        //        tv.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tv.register(PlayerTableViewCell.self, forCellReuseIdentifier: PlayerTableViewCell.cellId)
        return tv
    }()
    
    func configData(){
        playersviewmodel.getAllData { success in
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
    }

}

private extension PlayersViewController{
    
    func configure(){
        backBtn.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
        tableview.dataSource = self
        
        self.view.addSubview(backBtn)
        self.view.addSubview(headlbl)
        self.view.addSubview(tableview)
        
        NSLayoutConstraint.activate([
            backBtn.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            backBtn.heightAnchor.constraint(equalToConstant: 10),
            
            tableview.topAnchor.constraint(equalTo: self.headlbl.bottomAnchor),
            tableview.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 8),
            tableview.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -8),
            tableview.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor,constant: -8),
            
            headlbl.topAnchor.constraint(equalTo: self.backBtn.bottomAnchor,constant: 8),
            headlbl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 8),
            headlbl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -8),
        ])
    }
    
    @objc func goBack(){
        self.dismiss(animated: false, completion: nil)
    }
}

extension PlayersViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playersviewmodel.players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let player = playersviewmodel.players[indexPath.row]
        let cell = tableview.dequeueReusableCell(withIdentifier: PlayerTableViewCell.cellId, for: indexPath) as! PlayerTableViewCell
        cell.configure(with :player)
        return cell
    }
}
