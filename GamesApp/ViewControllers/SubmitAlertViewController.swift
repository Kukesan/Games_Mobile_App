//
//  SubmitAlertViewController.swift
//  GamesApp
//
//  Created by Ketheeswaran Kukesan on 2023-03-20.
//

import UIKit

class SubmitAlertViewController: UIViewController {
    
    var currentSubmitAlertState : Bool = false
    
    init(currentSubmitAlertState : Bool) {
        super.init(nibName: nil, bundle: nil)
        self.currentSubmitAlertState = currentSubmitAlertState
        print(currentSubmitAlertState)
    }
    
    required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func loadView() {
        super.loadView()
        configure()
    }
    
    private lazy var submitAlertViewContainer : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.shadowRadius = 10
        return view
    }()
    
    private lazy var submitAlertHead : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        return label
    }()
    
    private lazy var submitAlertSubject : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 14.0, weight: .light)
        return label
    }()
    
    private lazy var submitImg : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var goTeamButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .brown
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var closeButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        return button
    }()
    
    func configure(){
        
        if(currentSubmitAlertState == true){
            submitAlertHead.text = "Submit Successfully"
            submitAlertSubject.text = "Now You Can See Your Team Members"
            submitImg.image = UIImage(named: "welcome.jpeg")
            
            goTeamButton.setTitle("Join", for: .normal)
            goTeamButton.addTarget(self, action: #selector(goTeamView), for: .touchUpInside)
        }else{
            submitAlertHead.text = "User Already Registered"
            submitAlertSubject.text = "One Player can only Registered One Time"
            submitImg.image = UIImage(named: "tryagain.jpeg")
            
            goTeamButton.setTitle("Back", for: .normal)
            goTeamButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        }
        
        closeButton.setImage(UIImage(named: "close-icon.jpeg"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeVw), for: .touchUpInside)
        
        self.view.addSubview(submitAlertViewContainer)
        self.submitAlertViewContainer.addSubview(submitAlertHead)
        self.submitAlertViewContainer.addSubview(submitAlertSubject)
        self.submitAlertViewContainer.addSubview(submitImg)
        self.submitAlertViewContainer.addSubview(goTeamButton)
        self.submitAlertViewContainer.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            submitAlertViewContainer.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 260),
            submitAlertViewContainer.bottomAnchor.constraint(equalTo: self.goTeamButton.bottomAnchor,constant: 10),
            submitAlertViewContainer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 10),
            submitAlertViewContainer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -10),
            
            submitAlertHead.topAnchor.constraint(equalTo: self.submitAlertViewContainer.topAnchor,constant: 15),
            submitAlertHead.leadingAnchor.constraint(equalTo: self.submitAlertViewContainer.leadingAnchor),
            submitAlertHead.trailingAnchor.constraint(equalTo: self.submitAlertViewContainer.trailingAnchor),
            
            closeButton.trailingAnchor.constraint(equalTo: self.submitAlertViewContainer.trailingAnchor,constant: -10),
            closeButton.topAnchor.constraint(equalTo: self.submitAlertViewContainer.topAnchor,constant: 10),
            closeButton.heightAnchor.constraint(equalToConstant: 20),
            closeButton.widthAnchor.constraint(equalToConstant: 20),
            
            submitImg.topAnchor.constraint(equalTo: self.submitAlertHead.bottomAnchor,constant: 8),
            submitImg.leadingAnchor.constraint(equalTo: self.submitAlertViewContainer.leadingAnchor,constant: 120),
            submitImg.trailingAnchor.constraint(equalTo: self.submitAlertViewContainer.trailingAnchor,constant: -120),
            submitImg.heightAnchor.constraint(equalToConstant: 140),
            
            submitAlertSubject.topAnchor.constraint(equalTo: self.submitImg.bottomAnchor,constant: 8),
            submitAlertSubject.leadingAnchor.constraint(equalTo: self.submitAlertViewContainer.leadingAnchor),
            submitAlertSubject.trailingAnchor.constraint(equalTo: self.submitAlertViewContainer.trailingAnchor),
            
            goTeamButton.topAnchor.constraint(equalTo: self.submitAlertSubject.bottomAnchor,constant: 15),
            goTeamButton.leadingAnchor.constraint(equalTo: self.submitAlertViewContainer.leadingAnchor,constant: 100),
            goTeamButton.trailingAnchor.constraint(equalTo: self.submitAlertViewContainer.trailingAnchor,constant: -100),

        ])
    }
    
    @objc func closeVw(){
        let vc = FullGamesViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc,animated: false)
    }
    
    @objc func goTeamView(){
        let vc = PlayersViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc,animated: false)
    }
    
    @objc func goBack(){
        self.dismiss(animated: false, completion: nil)
    }
}
