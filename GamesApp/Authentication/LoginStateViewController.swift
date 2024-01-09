//
//  LoginStateViewController.swift
//  GamesApp
//
//  Created by Ketheeswaran Kukesan on 2023-04-04.
//

import UIKit

class LoginStateViewController: UIViewController {

    var loginState : Bool = false
    var loginText : String = ""
    
    init(loginState: Bool, loginText: String) {
        super.init(nibName: nil, bundle: nil)
        self.loginState = loginState
        self.loginText = loginText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    override func loadView() {
        super.loadView()
        configure()
    }
    
    private lazy var loginStateView : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.layer.shadowRadius = 4
        
        return view
    }()
    
    private lazy var loginStateHeadLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18.0, weight: .bold)
        return label
    }()
    
    private lazy var loginStateLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = self.loginText
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16.0, weight: .regular)
        return label
    }()
    
    private lazy var stateButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .brown
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(nav), for: .touchUpInside)
        return button
    }()
    
    func configure(){
        
        if(self.loginState == true ){
            loginStateHeadLabel.text = "Successfully Login"
            stateButton.setTitle("Get Started", for: .normal)
        }else{
            loginStateHeadLabel.text = "Try Again"
            stateButton.setTitle("Back", for: .normal)
        }
        
        self.view.addSubview(loginStateView)
        
        loginStateView.addSubview(loginStateHeadLabel)
        loginStateView.addSubview(loginStateLabel)
        loginStateView.addSubview(stateButton)
        
        NSLayoutConstraint.activate([
            loginStateView.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 300),
            loginStateView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 16),
            loginStateView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -16),
            loginStateView.bottomAnchor.constraint(equalTo: stateButton.bottomAnchor,constant: 16),
            
            loginStateHeadLabel.topAnchor.constraint(equalTo: loginStateView.topAnchor,constant: 16),
            loginStateHeadLabel.leadingAnchor.constraint(equalTo: loginStateView.leadingAnchor,constant: 8),
            loginStateHeadLabel.trailingAnchor.constraint(equalTo: loginStateView.trailingAnchor,constant: -8),
            
            loginStateLabel.topAnchor.constraint(equalTo: loginStateHeadLabel.bottomAnchor,constant: 16),
            loginStateLabel.leadingAnchor.constraint(equalTo: loginStateView.leadingAnchor,constant: 16),
            loginStateLabel.trailingAnchor.constraint(equalTo: loginStateView.trailingAnchor,constant: -16),
            
            stateButton.topAnchor.constraint(equalTo: loginStateLabel.bottomAnchor,constant: 16),
            stateButton.leadingAnchor.constraint(equalTo: loginStateView.leadingAnchor,constant: 100),
            stateButton.trailingAnchor.constraint(equalTo: loginStateView.trailingAnchor,constant: -100),
            stateButton.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    
    @objc func nav(){
        if(self.loginState == true ){
            let vc = FullGamesViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc,animated: false)
        }else{
            self.dismiss(animated: false, completion: nil)
        }
    }
    
}
