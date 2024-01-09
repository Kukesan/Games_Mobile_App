//
//  ResetStateViewController.swift
//  GamesApp
//
//  Created by Ketheeswaran Kukesan on 2023-04-04.
//

import UIKit

class ResetStateViewController: UIViewController {
    
    var resetState : Bool = false
    var stateText : String = ""
    
    init(resetState: Bool, stateText: String) {
        super.init(nibName: nil, bundle: nil)
        self.resetState = resetState
        self.stateText = stateText
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
    
    private lazy var resetStateView : UIView = {
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
    
    private lazy var resetStateHeadLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18.0, weight: .bold)
        return label
    }()
    
    private lazy var resetStateLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = self.stateText
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
        
        if(self.resetState == true ){
            resetStateHeadLabel.text = "Verification Sent"
            stateButton.setTitle("OK", for: .normal)
        }else{
            resetStateHeadLabel.text = "Try Again"
            stateButton.setTitle("Back", for: .normal)
        }
        
        self.view.addSubview(resetStateView)
        
        resetStateView.addSubview(resetStateHeadLabel)
        resetStateView.addSubview(resetStateLabel)
        resetStateView.addSubview(stateButton)
        
        NSLayoutConstraint.activate([
            resetStateView.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 300),
            resetStateView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 16),
            resetStateView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -16),
            resetStateView.bottomAnchor.constraint(equalTo: stateButton.bottomAnchor,constant: 16),
            
            resetStateHeadLabel.topAnchor.constraint(equalTo: resetStateView.topAnchor,constant: 16),
            resetStateHeadLabel.leadingAnchor.constraint(equalTo: resetStateView.leadingAnchor,constant: 8),
            resetStateHeadLabel.trailingAnchor.constraint(equalTo: resetStateView.trailingAnchor,constant: -8),
            
            resetStateLabel.topAnchor.constraint(equalTo: resetStateHeadLabel.bottomAnchor,constant: 16),
            resetStateLabel.leadingAnchor.constraint(equalTo: resetStateView.leadingAnchor,constant: 16),
            resetStateLabel.trailingAnchor.constraint(equalTo: resetStateView.trailingAnchor,constant: -16),
            
            stateButton.topAnchor.constraint(equalTo: resetStateLabel.bottomAnchor,constant: 16),
            stateButton.leadingAnchor.constraint(equalTo: resetStateView.leadingAnchor,constant: 100),
            stateButton.trailingAnchor.constraint(equalTo: resetStateView.trailingAnchor,constant: -100),
            stateButton.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    
    @objc func nav(){
        if(self.resetState == true ){
            let vc = AuthenticationViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc,animated: false)
        }else{
            self.dismiss(animated: false, completion: nil)
        }
    }
}
