//
//  CreateUserViewController.swift
//  GamesApp
//
//  Created by Ketheeswaran Kukesan on 2023-04-03.
//

import UIKit
import FirebaseAuth

class CreateUserViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    override func loadView(){
        super.loadView()
        configure()
    }
    
    private lazy var emailSignInView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.brown.cgColor
        view.backgroundColor = .white
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.layer.shadowRadius = 4
        return view
    }()
    
    private lazy var headingLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .brown
        label.text = "Create New Account"
        label.font = .systemFont(ofSize: 18.0, weight: .bold)
        return label
    }()
    
    private lazy var emailLabel : UILabel = {
        let label = UILabel()
        label.text = "Enter Your Email"
        label.translatesAutoresizingMaskIntoConstraints = false
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
    
    private lazy var passwordLabel : UILabel = {
        let label = UILabel()
        label.text = "Enter Your Password"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16.0, weight: .regular)
        return label
    }()
    
    private lazy var passwordInput : UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.borderColor = UIColor.brown.cgColor
        textfield.layer.borderWidth = 1
        return textfield
    }()
    
    private lazy var confirmPasswordLabel : UILabel = {
        let label = UILabel()
        label.text = "Confirm Your Password"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16.0, weight: .regular)
        return label
    }()
    
    private lazy var confirmPasswordInput : UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.borderColor = UIColor.brown.cgColor
        textfield.layer.borderWidth = 1
        return textfield
    }()
    
    private lazy var submitButton : UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Submit", for: .normal)
        button.backgroundColor = .brown
        button.layer.cornerRadius = 5
        return button
    }()
    
    private lazy var isAccountHasLabel : UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Already I Have Account", for: .normal)
        button.addTarget(self, action: #selector(goSignIn), for: .touchUpInside)
        button.setTitleColor(.brown, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .light)
        return button
    }()

    func configure(){
        submitButton.addTarget(self, action: #selector(submit), for: .touchUpInside)
        
        self.view.addSubview(emailSignInView)
        
        emailSignInView.addSubview(headingLabel)
        emailSignInView.addSubview(emailLabel)
        emailSignInView.addSubview(emailInput)
        emailSignInView.addSubview(passwordLabel)
        emailSignInView.addSubview(passwordInput)
        emailSignInView.addSubview(submitButton)
        emailSignInView.addSubview(confirmPasswordLabel)
        emailSignInView.addSubview(confirmPasswordInput)
        emailSignInView.addSubview(isAccountHasLabel)
        
        NSLayoutConstraint.activate([
            emailSignInView.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 200),
            emailSignInView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 16),
            emailSignInView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -16),
            emailSignInView.bottomAnchor.constraint(equalTo: isAccountHasLabel.bottomAnchor,constant: 16),
            
            headingLabel.topAnchor.constraint(equalTo: emailSignInView.topAnchor,constant: 24),
            headingLabel.heightAnchor.constraint(equalToConstant: 24),
            headingLabel.leadingAnchor.constraint(equalTo: emailSignInView.leadingAnchor,constant: 8),
            headingLabel.trailingAnchor.constraint(equalTo: emailSignInView.trailingAnchor,constant: -8),
            
            emailLabel.topAnchor.constraint(equalTo: headingLabel.bottomAnchor,constant: 12),
            emailLabel.heightAnchor.constraint(equalToConstant: 16),
            emailLabel.leadingAnchor.constraint(equalTo: emailSignInView.leadingAnchor,constant: 12),
            emailLabel.trailingAnchor.constraint(equalTo: emailSignInView.trailingAnchor,constant: -12),
            
            emailInput.topAnchor.constraint(equalTo: emailLabel.bottomAnchor,constant: 2),
            emailInput.heightAnchor.constraint(equalToConstant: 30),
            emailInput.leadingAnchor.constraint(equalTo: emailSignInView.leadingAnchor,constant: 12),
            emailInput.trailingAnchor.constraint(equalTo: emailSignInView.trailingAnchor,constant: -12),
            
            passwordLabel.topAnchor.constraint(equalTo: emailInput.bottomAnchor,constant: 8),
            passwordLabel.heightAnchor.constraint(equalToConstant: 16),
            passwordLabel.leadingAnchor.constraint(equalTo: emailSignInView.leadingAnchor,constant: 12),
            passwordLabel.trailingAnchor.constraint(equalTo: emailSignInView.trailingAnchor,constant: -12),
            
            passwordInput.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor,constant: 2),
            passwordInput.heightAnchor.constraint(equalToConstant: 30),
            passwordInput.leadingAnchor.constraint(equalTo: emailSignInView.leadingAnchor,constant: 12),
            passwordInput.trailingAnchor.constraint(equalTo: emailSignInView.trailingAnchor,constant: -12),
            
            confirmPasswordLabel.topAnchor.constraint(equalTo: passwordInput.bottomAnchor,constant: 8),
            confirmPasswordLabel.heightAnchor.constraint(equalToConstant: 16),
            confirmPasswordLabel.leadingAnchor.constraint(equalTo: emailSignInView.leadingAnchor,constant: 12),
            confirmPasswordLabel.trailingAnchor.constraint(equalTo: emailSignInView.trailingAnchor,constant: -12),
            
            confirmPasswordInput.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor,constant: 2),
            confirmPasswordInput.heightAnchor.constraint(equalToConstant: 30),
            confirmPasswordInput.leadingAnchor.constraint(equalTo: emailSignInView.leadingAnchor,constant: 12),
            confirmPasswordInput.trailingAnchor.constraint(equalTo: emailSignInView.trailingAnchor,constant: -12),
            
            submitButton.topAnchor.constraint(equalTo: confirmPasswordInput.bottomAnchor,constant: 12),
            submitButton.heightAnchor.constraint(equalToConstant: 35),
            submitButton.leadingAnchor.constraint(equalTo: emailSignInView.leadingAnchor,constant: 100),
            submitButton.trailingAnchor.constraint(equalTo: emailSignInView.trailingAnchor,constant: -100),
            
            isAccountHasLabel.topAnchor.constraint(equalTo: submitButton.bottomAnchor,constant: 2),
            isAccountHasLabel.heightAnchor.constraint(equalToConstant: 35),
            isAccountHasLabel.leadingAnchor.constraint(equalTo: emailSignInView.leadingAnchor),
            isAccountHasLabel.trailingAnchor.constraint(equalTo: emailSignInView.trailingAnchor),
            
        ])
    }
    
    @objc func submit(){
        let email = emailInput.text!
        let password = passwordInput.text!
        let confirmPassword = confirmPasswordInput.text!
        if( password == confirmPassword ){
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error as? NSError {
                    //                switch AuthErrorCode(rawValue: error.code) {
                    //                case .operationNotAllowed:
                    //                    // Error: The given sign-in provider is disabled for this Firebase project. Enable it in the Firebase console, under the sign-in method tab of the Auth section.
                    //                case .emailAlreadyInUse:
                    //                    // Error: The email address is already in use by another account.
                    //                case .invalidEmail:
                    //                    // Error: The email address is badly formatted.
                    //                case .weakPassword:
                    //                    // Error: The password must be 6 characters long or more.
                    //                default:
                    print("Error: \(error.localizedDescription)")
                    ////                }
                } else {
                    print("User signs up successfully")
                    let newUserInfo = Auth.auth().currentUser
                    let email = newUserInfo?.email
                    
                    let vc = FullGamesViewController()
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc , animated: false)
                }
            }
        }else{
            print("Password not match")
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
      let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
      let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
      return emailPred.evaluate(with: email)
    }
    
    func isValidPassword(_ password: String) -> Bool {
      let minPasswordLength = 6
      return password.count >= minPasswordLength
    }
    
    @objc func goSignIn(){
        let vc = AuthenticationViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc , animated: false)
    }
    
}
