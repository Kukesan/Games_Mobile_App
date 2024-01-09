//
//  FullGamesViewController.swift
//  GamesApp
//
//  Created by Ketheeswaran Kukesan on 2023-02-28.
//

import UIKit
import FirebaseAuth

class FullGamesViewController: UIViewController {
    
    private lazy var tableview: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 60
        tv.separatorStyle = .none
        tv.register(GameTableViewCell.self, forCellReuseIdentifier: GameTableViewCell.cellId)
        return tv
    }()
    
    private lazy var backBtn : UIButton = {
        let backbtn = UIButton()
        backbtn.setTitle("Back", for: .normal)
        backbtn.translatesAutoresizingMaskIntoConstraints = false
        backbtn.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        return backbtn
    }()
    
    private lazy var logoutBtn : UIButton = {
       let lgbtn = UIButton()
        lgbtn.translatesAutoresizingMaskIntoConstraints = false
        lgbtn.setTitle("LogOut", for: .normal)
        lgbtn.addTarget(self, action: #selector(logOut), for: .touchUpInside)
        return lgbtn
    }()

    private lazy var addPlayerBtn : UIButton = {
        let addbtn = UIButton()
        addbtn.setTitle("All Players", for: .normal)
        addbtn.translatesAutoresizingMaskIntoConstraints = false
        addbtn.addTarget(self, action: #selector(addPlayers), for: .touchUpInside)
        return addbtn
    }()
    
    
    private lazy var gamesViewModel = GamesViewModel()
    
    override func loadView() {
        super.loadView()
        setup()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

private extension FullGamesViewController{
    func setup() {
        
        self.navigationController?.navigationBar.topItem?.title = "Available Games"
        self.navigationController?.navigationBar.backgroundColor = .white
        
        tableview.dataSource = self
        
        self.view.addSubview(tableview)
        self.view.addSubview(backBtn)
        self.view.addSubview(logoutBtn)
        self.view.addSubview(addPlayerBtn)
        
        NSLayoutConstraint.activate([
            backBtn.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            backBtn.heightAnchor.constraint(equalToConstant: 20),
            
            logoutBtn.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            logoutBtn.heightAnchor.constraint(equalToConstant: 20),
            logoutBtn.leadingAnchor.constraint(equalTo: backBtn.trailingAnchor,constant: 4),

            addPlayerBtn.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            addPlayerBtn.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -8),
            addPlayerBtn.heightAnchor.constraint(equalToConstant: 20),
            
            tableview.topAnchor.constraint(equalTo: self.addPlayerBtn.bottomAnchor,constant: 10),
            tableview.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableview.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    @objc func goBack(){
//        self.dismiss(animated: false, completion: nil)
        let vc = LandingViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc , animated : false)
    }
    
    @objc func addPlayers(){
        let vc = PlayersViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc , animated : false)
    }
    
    @objc func logOut(){
        do {
          try Auth.auth().signOut()
        } catch {
          print("Sign out error")
        }
        
        let vc = LandingViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc , animated : false)
    }
}

extension FullGamesViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gamesViewModel.games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let game = gamesViewModel.games[indexPath.row]
        let cell = tableview.dequeueReusableCell(withIdentifier: GameTableViewCell.cellId, for: indexPath) as! GameTableViewCell
        cell.configure(with :game, delegate: self)
        return cell
    }
    
}

extension FullGamesViewController : GameTableViewCellDelegate {
    func visible(for game: Game) {
        print("click \(game.name)")
        gamesViewModel.visible(for: game)
        
        let vc = EnrollAlertViewController(gameName : game.name.rawValue)
        vc.modalPresentationStyle = .popover
        self.present(vc, animated: true)
        tableview.reloadData()
    }
    
    func goTeamPlayers(for game: Game) {
        print("click \(game.name)")
        gamesViewModel.visible(for: game)
        
        let vc = GamePlayersViewController(gameName : game.name.rawValue)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        tableview.reloadData()
    }
}
