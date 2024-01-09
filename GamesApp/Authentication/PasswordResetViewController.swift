//
//  PasswordResetViewController.swift
//  GamesApp
//
//  Created by Ketheeswaran Kukesan on 2023-04-04.
//

import UIKit
import FirebaseAuth

class PasswordResetViewController: UIViewController {
    
    var currentResetState : Bool = false
    var currentResetText : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    override func loadView() {
        super.loadView()
        configure()
    }
    
    private lazy var passwordResetView : UIView = {
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
    
    private lazy var titleLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter Your Email And get Link for Reset Password"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16.0, weight: .regular)
        return label
    }()

    private lazy var emailInput : UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.borderColor = UIColor.brown.cgColor
        textfield.layer.borderWidth = 1
        return textfield
    }()
    
    private lazy var submitButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sent", for: .normal)
        button.backgroundColor = .brown
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(sentEmail), for: .touchUpInside)
        return button
    }()
    
    private lazy var backButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .light)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        return button
    }()
    
    func configure(){
        
        self.view.addSubview(passwordResetView)
        
        passwordResetView.addSubview(titleLabel)
        passwordResetView.addSubview(emailInput)
        passwordResetView.addSubview(submitButton)
        passwordResetView.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            passwordResetView.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 300),
            passwordResetView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 16),
            passwordResetView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -16),
            passwordResetView.bottomAnchor.constraint(equalTo: backButton.bottomAnchor,constant: 16),
            
            titleLabel.topAnchor.constraint(equalTo: passwordResetView.topAnchor,constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: passwordResetView.leadingAnchor,constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: passwordResetView.trailingAnchor,constant: -8),
            
            emailInput.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 16),
            emailInput.leadingAnchor.constraint(equalTo: passwordResetView.leadingAnchor,constant: 16),
            emailInput.trailingAnchor.constraint(equalTo: passwordResetView.trailingAnchor,constant: -16),
            emailInput.heightAnchor.constraint(equalToConstant: 30),
            
            submitButton.topAnchor.constraint(equalTo: emailInput.bottomAnchor,constant: 16),
            submitButton.leadingAnchor.constraint(equalTo: passwordResetView.leadingAnchor,constant: 100),
            submitButton.trailingAnchor.constraint(equalTo: passwordResetView.trailingAnchor,constant: -100),
            submitButton.heightAnchor.constraint(equalToConstant: 30),
            
            backButton.topAnchor.constraint(equalTo: submitButton.bottomAnchor,constant: 8),
            backButton.leadingAnchor.constraint(equalTo: passwordResetView.leadingAnchor),
            backButton.trailingAnchor.constraint(equalTo: passwordResetView.trailingAnchor),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    
    @objc func sentEmail(){
        Auth.auth().sendPasswordReset(withEmail: emailInput.text!) { (error) in
            if let error = error as? NSError {
                print("Error message: \(error.localizedDescription)")
                let vc = ResetStateViewController(resetState : false, stateText : error.localizedDescription )
                vc.modalPresentationStyle = .fullScreen
                self.present(vc , animated: false)
            } else {
                print("Reset password email has been successfully sent")
                
                let vc = ResetStateViewController(resetState : true, stateText : "Reset password email has been successfully sent" )
                vc.modalPresentationStyle = .fullScreen
                self.present(vc , animated: false)
          }
        }
    }
    
    @objc func goBack(){
        self.dismiss(animated: false, completion: nil)
    }
}
