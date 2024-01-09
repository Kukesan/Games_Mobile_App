//
//  AuthenticationViewController.swift
//  GamesApp
//
//  Created by Ketheeswaran Kukesan on 2023-03-31.
//

import UIKit
import GoogleSignIn
import FirebaseAuth


class AuthenticationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    override func loadView(){
        super.loadView()
        configure()
        passwordInput.isSecureTextEntry = true
    }
    
    private lazy var authenticationView : UIView = {
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
    
    private lazy var headingLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .brown
        label.text = "Login Account"
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
        textfield.autocapitalizationType = UITextAutocapitalizationType.none
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
        textfield.autocapitalizationType = UITextAutocapitalizationType.none
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
    
    private lazy var createAccountLabel : UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create New Account", for: .normal)
        button.addTarget(self, action: #selector(goSignUp), for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .light)
        return button
    }()
    
    private lazy var googleSignInView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 15
        view.layer.borderColor = UIColor.brown.cgColor
        return view
    }()
    
    private lazy var signInButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.brown, for: .normal)
        button.setTitle("SignIn With Google", for: .normal)
        button.addTarget(self, action: #selector(signIn(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var signInImageButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(signIn(_:)), for: .touchUpInside)
        button.setImage(UIImage(named: "google"), for: .normal)
        return button
    }()
    
    private lazy var forgetPasswordButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Forget My Password", for: .normal)
        button.addTarget(self, action: #selector(resetPassword), for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .light)
        return button
    }()
    
    private lazy var eyeImage : UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "eyeclose"), for: .normal)
        button.setImage(UIImage(named: "eyeopen"), for: .selected)
        button.addTarget(self, action: #selector(showHidePassword(_:)), for: .touchUpInside)
        return button
    }()
    
    func configure(){
        
        passwordInput.rightView = eyeImage
        passwordInput.frame = eyeImage.frame.offsetBy(dx: 6, dy: 0)
        passwordInput.rightViewMode = .always
        
        submitButton.addTarget(self, action: #selector(submit), for: .touchUpInside)
        
        self.view.addSubview(authenticationView)
        
        authenticationView.addSubview(headingLabel)
        authenticationView.addSubview(emailLabel)
        authenticationView.addSubview(emailInput)
        authenticationView.addSubview(passwordLabel)
        authenticationView.addSubview(passwordInput)
        authenticationView.addSubview(submitButton)
        authenticationView.addSubview(createAccountLabel)
        authenticationView.addSubview(googleSignInView)
        
        passwordInput.addSubview(eyeImage)
        
        googleSignInView.addSubview(signInButton)
        googleSignInView.addSubview(signInImageButton)
        
        authenticationView.addSubview(forgetPasswordButton)
        
        
        NSLayoutConstraint.activate([
            authenticationView.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 200),
            authenticationView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 16),
            authenticationView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -16),
            authenticationView.bottomAnchor.constraint(equalTo: forgetPasswordButton.bottomAnchor,constant: 24),
            
            headingLabel.topAnchor.constraint(equalTo: authenticationView.topAnchor,constant: 24),
            headingLabel.heightAnchor.constraint(equalToConstant: 24),
            headingLabel.leadingAnchor.constraint(equalTo: authenticationView.leadingAnchor,constant: 8),
            headingLabel.trailingAnchor.constraint(equalTo: authenticationView.trailingAnchor,constant: -8),
            
            emailLabel.topAnchor.constraint(equalTo: headingLabel.bottomAnchor,constant: 12),
            emailLabel.leadingAnchor.constraint(equalTo: authenticationView.leadingAnchor,constant: 12),
            emailLabel.trailingAnchor.constraint(equalTo: authenticationView.trailingAnchor,constant: -12),
            emailLabel.heightAnchor.constraint(equalToConstant: 16),
            
            emailInput.topAnchor.constraint(equalTo: emailLabel.bottomAnchor,constant: 2),
            emailInput.heightAnchor.constraint(equalToConstant: 30),
            emailInput.leadingAnchor.constraint(equalTo: authenticationView.leadingAnchor,constant: 12),
            emailInput.trailingAnchor.constraint(equalTo: authenticationView.trailingAnchor,constant: -12),
            
            passwordLabel.topAnchor.constraint(equalTo: emailInput.bottomAnchor,constant: 8),
            passwordLabel.leadingAnchor.constraint(equalTo: authenticationView.leadingAnchor,constant: 12),
            passwordLabel.trailingAnchor.constraint(equalTo: authenticationView.trailingAnchor,constant: -12),
            passwordLabel.heightAnchor.constraint(equalToConstant: 16),
            
            passwordInput.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor,constant: 2),
            passwordInput.heightAnchor.constraint(equalToConstant: 30),
            passwordInput.leadingAnchor.constraint(equalTo: authenticationView.leadingAnchor,constant: 12),
            passwordInput.trailingAnchor.constraint(equalTo: authenticationView.trailingAnchor,constant: -12),
            
            submitButton.topAnchor.constraint(equalTo: passwordInput.bottomAnchor,constant: 12),
            submitButton.heightAnchor.constraint(equalToConstant: 35),
            submitButton.leadingAnchor.constraint(equalTo: authenticationView.leadingAnchor,constant: 100),
            submitButton.trailingAnchor.constraint(equalTo: authenticationView.trailingAnchor,constant: -100),
            
            createAccountLabel.topAnchor.constraint(equalTo: submitButton.bottomAnchor,constant: 2),
            createAccountLabel.heightAnchor.constraint(equalToConstant: 35),
            createAccountLabel.leadingAnchor.constraint(equalTo: authenticationView.leadingAnchor),
            createAccountLabel.trailingAnchor.constraint(equalTo: authenticationView.trailingAnchor),
            
            googleSignInView.topAnchor.constraint(equalTo: createAccountLabel.bottomAnchor,constant: 20),
            googleSignInView.leadingAnchor.constraint(equalTo: authenticationView.leadingAnchor,constant:70),
            googleSignInView.trailingAnchor.constraint(equalTo: authenticationView.trailingAnchor, constant: -70),
            googleSignInView.bottomAnchor.constraint(equalTo: signInImageButton.bottomAnchor,constant: 4),
            
            signInImageButton.topAnchor.constraint(equalTo: googleSignInView.topAnchor,constant:4),
            signInImageButton.leadingAnchor.constraint(equalTo: googleSignInView.leadingAnchor,constant: 8),
            signInImageButton.widthAnchor.constraint(equalToConstant: 40),
            signInImageButton.heightAnchor.constraint(equalToConstant: 40),
            
            signInButton.topAnchor.constraint(equalTo: googleSignInView.topAnchor,constant:4),
            signInButton.leadingAnchor.constraint(equalTo: signInImageButton.trailingAnchor,constant: -8),
            signInButton.heightAnchor.constraint(equalToConstant: 40),
            signInButton.trailingAnchor.constraint(equalTo: googleSignInView.trailingAnchor),
            
            forgetPasswordButton.topAnchor.constraint(equalTo: googleSignInView.bottomAnchor,constant: 2),
            forgetPasswordButton.heightAnchor.constraint(equalToConstant: 35),
            forgetPasswordButton.leadingAnchor.constraint(equalTo: authenticationView.leadingAnchor),
            forgetPasswordButton.trailingAnchor.constraint(equalTo: authenticationView.trailingAnchor),
            
            eyeImage.heightAnchor.constraint(equalToConstant: 30),
            eyeImage.widthAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    
    @objc func signIn(_ sender: Any) {
      GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
        guard error == nil else { return }
          let vc = FullGamesViewController()
          vc.modalPresentationStyle = .fullScreen
          self.present(vc,animated: false)
      }
    }
    
    @objc func submit(){
        let email = emailInput.text!
        let password = passwordInput.text!
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error as? NSError {
                print("Error: \(error.localizedDescription)")
                let vc = LoginStateViewController(loginState: false, loginText: error.localizedDescription)
                vc.modalPresentationStyle = .fullScreen
                self.present(vc , animated: false)
            } else {
                print("User signs in successfully")
//                let userInfo = Auth.auth().currentUser
//                let email = userInfo?.email
                
                let vc = LoginStateViewController(loginState: true, loginText: "Now You Can Join with Us")
                vc.modalPresentationStyle = .fullScreen
                self.present(vc , animated: false)
            }
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
    
    @objc func goSignUp(){
        let vc = CreateUserViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc , animated: false)
    }
    
    @objc func resetPassword(){
        let vc = PasswordResetViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc , animated: false)
    }
    
    @objc private func showHidePassword(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        passwordInput.isSecureTextEntry = !sender.isSelected
    }
}


