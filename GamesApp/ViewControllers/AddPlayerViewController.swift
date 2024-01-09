//
//  AddPlayerViewController.swift
//  GamesApp
//
//  Created by Ketheeswaran Kukesan on 2023-03-16.
//

import UIKit
import FirebaseDatabase

class AddPlayerViewController: UIViewController {

    var ref: DatabaseReference!
    
    public var submitAlertState : Bool = false
    
    public var nicCheck : Bool = false
    public var gameName : Any = ""
    
    init(gameName : Any){
        super.init(nibName: nil, bundle: nil)
        self.gameName = gameName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        super.loadView()
        ref = Database.database(url: "https://games-939eb-default-rtdb.asia-southeast1.firebasedatabase.app/").reference()
        configure()
    }
    
    private lazy var containerVw : UIView = {
        let vw = UIView()
        vw.backgroundColor = .white
        vw.layer.cornerRadius = 10
        vw.layer.shadowRadius = 10
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    
    private lazy var titleLbl : UILabel = {
        let titlelbl = UILabel()
        titlelbl.translatesAutoresizingMaskIntoConstraints = false
        titlelbl.textColor = .black
        titlelbl.textAlignment = .center
        titlelbl.font = UIFont.boldSystemFont(ofSize: 20.0)
        titlelbl.text = "Player Details"
        return titlelbl
    }()
    
    private lazy var nicLbl : UILabel = {
        let niclbl =  UILabel()
        niclbl.translatesAutoresizingMaskIntoConstraints = false
        niclbl.textColor = .black
        niclbl.text = "NIC"
        return niclbl
    }()
    
    private lazy var nicIp : UITextField = {
        var nicip = UITextField()
        nicip.translatesAutoresizingMaskIntoConstraints = false
        nicip.backgroundColor = .white
        nicip.layer.borderWidth = 1
        nicip.layer.borderColor = UIColor.brown.cgColor
        nicip.layer.cornerRadius = 3
        nicip.textColor = .black
        return nicip
    }()
    
    private lazy var nicAlert : UILabel = {
        var nicalrt = UILabel()
        nicalrt.translatesAutoresizingMaskIntoConstraints = false
        nicalrt.font = UIFont.systemFont(ofSize: 14.0, weight: .light)
        nicalrt.textAlignment = .left
        return nicalrt
    }()
    
    private lazy var nameLbl : UILabel = {
        let namelbl =  UILabel()
        namelbl.translatesAutoresizingMaskIntoConstraints = false
        namelbl.textColor = .black
        namelbl.text = "Name"
        return namelbl
    }()
    
    private lazy var nameIp : UITextField = {
        var naip = UITextField()
        naip.translatesAutoresizingMaskIntoConstraints = false
        naip.backgroundColor = .white
        naip.layer.borderWidth = 1
        naip.layer.borderColor = UIColor.brown.cgColor
        naip.layer.cornerRadius = 3
        naip.textColor = .black
        return naip
    }()
    
    private lazy var nameAlert : UILabel = {
        var namealrt = UILabel()
        namealrt.translatesAutoresizingMaskIntoConstraints = false
        namealrt.font = UIFont.systemFont(ofSize: 14.0, weight: .light)
        namealrt.textAlignment = .left
        return namealrt
    }()
    
    private lazy var ageLbl : UILabel = {
        let agelbl =  UILabel()
        agelbl.translatesAutoresizingMaskIntoConstraints = false
        agelbl.textColor = .black
        agelbl.text = "Age"
        return agelbl
    }()
    
    private lazy var ageIp : UITextField = {
        var aip = UITextField()
        aip.translatesAutoresizingMaskIntoConstraints = false
        aip.backgroundColor = .white
        aip.layer.borderWidth = 1
        aip.layer.borderColor = UIColor.brown.cgColor
        aip.layer.cornerRadius = 3
        aip.textColor = .black
        return aip
    }()
    
    private lazy var ageAlert : UILabel = {
        var agealrt = UILabel()
        agealrt.translatesAutoresizingMaskIntoConstraints = false
        agealrt.font = UIFont.systemFont(ofSize: 14.0, weight: .light)
        agealrt.textAlignment = .left
        return agealrt
    }()
    
    private lazy var submitBtn : UIButton = {
        var subtn = UIButton()
        subtn.translatesAutoresizingMaskIntoConstraints = false
        subtn.backgroundColor = .brown
        subtn.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .regular)
        subtn.layer.cornerRadius = 5
        subtn.bounds = view.frame.insetBy(dx: 10.0, dy: 10.0)
        subtn.setTitle("Submit", for: .normal)
        return subtn
    }()
    
    private lazy var submitAlert : UILabel = {
        var subalrt = UILabel()
        subalrt.translatesAutoresizingMaskIntoConstraints = false
        subalrt.font = UIFont.systemFont(ofSize: 14.0, weight: .light)
        subalrt.textAlignment = .center
        return subalrt
    }()
    
    private lazy var closebtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        return btn
    }()
    
    func setupTextFields(){
        nicIp.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        nameIp.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        ageIp.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }
    
    func configure(){
        
        self.view.addSubview(containerVw)
        
        submitBtn.addTarget(self, action: #selector(submit), for: .touchUpInside)
        
        closebtn.setImage(UIImage(named: "close-icon.jpeg"), for: .normal)
        closebtn.addTarget(self, action: #selector(closevw), for: .touchUpInside)

        self.containerVw.addSubview(titleLbl)
        
        self.containerVw.addSubview(nicLbl)
        self.containerVw.addSubview(nicIp)
        self.containerVw.addSubview(nicAlert)
        
        self.containerVw.addSubview(nameLbl)
        self.containerVw.addSubview(nameIp)
        self.containerVw.addSubview(nameAlert)
        
        self.containerVw.addSubview(ageLbl)
        self.containerVw.addSubview(ageIp)
        self.containerVw.addSubview(ageAlert)
        
        self.containerVw.addSubview(submitBtn)
        self.containerVw.addSubview(submitAlert)
        self.containerVw.addSubview(closebtn)
        
        NSLayoutConstraint.activate([
            containerVw.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 260),
            containerVw.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 10),
            containerVw.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -10),
            
            closebtn.trailingAnchor.constraint(equalTo: self.containerVw.trailingAnchor,constant: -10),
            closebtn.topAnchor.constraint(equalTo: self.containerVw.topAnchor,constant: 10),
            closebtn.heightAnchor.constraint(equalToConstant: 20),
            closebtn.widthAnchor.constraint(equalToConstant: 20),
            
            titleLbl.topAnchor.constraint(equalTo: self.containerVw.topAnchor,constant: 8),
            titleLbl.leadingAnchor.constraint(equalTo: self.containerVw.leadingAnchor),
            titleLbl.trailingAnchor.constraint(equalTo: self.containerVw.trailingAnchor),
            
            nicLbl.topAnchor.constraint(equalTo: self.titleLbl.bottomAnchor,constant: 12),
            nicLbl.leadingAnchor.constraint(equalTo: self.containerVw.leadingAnchor,constant: 12),
            
            nicIp.topAnchor.constraint(equalTo: self.nicLbl.bottomAnchor),
            nicIp.leadingAnchor.constraint(equalTo: self.containerVw.leadingAnchor,constant: 12),
            nicIp.trailingAnchor.constraint(equalTo: self.containerVw.trailingAnchor,constant: -12),
            nicIp.heightAnchor.constraint(equalToConstant: 32),
            
            nicAlert.topAnchor.constraint(equalTo: self.nicIp.bottomAnchor,constant: 4),
            nicAlert.leadingAnchor.constraint(equalTo: self.containerVw.leadingAnchor,constant: 12),
            nicAlert.trailingAnchor.constraint(equalTo: self.containerVw.trailingAnchor),
            
            nameLbl.topAnchor.constraint(equalTo: self.nicAlert.bottomAnchor,constant: 8),
            nameLbl.leadingAnchor.constraint(equalTo: self.containerVw.leadingAnchor,constant: 12),
            
            nameIp.topAnchor.constraint(equalTo: self.nameLbl.bottomAnchor),
            nameIp.leadingAnchor.constraint(equalTo: self.containerVw.leadingAnchor,constant: 12),
            nameIp.trailingAnchor.constraint(equalTo: self.containerVw.trailingAnchor,constant: -12),
            nameIp.heightAnchor.constraint(equalToConstant: 32),
            
            nameAlert.topAnchor.constraint(equalTo: self.nameIp.bottomAnchor,constant: 4),
            nameAlert.leadingAnchor.constraint(equalTo: self.containerVw.leadingAnchor,constant: 12),
            nameAlert.trailingAnchor.constraint(equalTo: self.containerVw.trailingAnchor),
            
            ageLbl.topAnchor.constraint(equalTo: self.nameAlert.bottomAnchor,constant: 8),
            ageLbl.leadingAnchor.constraint(equalTo: self.containerVw.leadingAnchor,constant: 12),
            
            ageIp.topAnchor.constraint(equalTo: self.ageLbl.bottomAnchor),
            ageIp.leadingAnchor.constraint(equalTo: self.containerVw.leadingAnchor,constant: 12),
            ageIp.trailingAnchor.constraint(equalTo: self.containerVw.trailingAnchor,constant: -12),
            ageIp.heightAnchor.constraint(equalToConstant: 32),
            
            ageAlert.topAnchor.constraint(equalTo: self.ageIp.bottomAnchor,constant: 4),
            ageAlert.leadingAnchor.constraint(equalTo: self.containerVw.leadingAnchor,constant: 12),
            ageAlert.trailingAnchor.constraint(equalTo: self.containerVw.trailingAnchor),
            
            submitBtn.topAnchor.constraint(equalTo: self.ageAlert.bottomAnchor,constant: 10),
            submitBtn.leadingAnchor.constraint(equalTo: self.containerVw.leadingAnchor,constant: 100),
            submitBtn.trailingAnchor.constraint(equalTo: self.containerVw.trailingAnchor,constant: -100),
            
            submitAlert.topAnchor.constraint(equalTo: self.submitBtn.bottomAnchor,constant: 4),
            submitAlert.leadingAnchor.constraint(equalTo: self.containerVw.leadingAnchor),
            submitAlert.trailingAnchor.constraint(equalTo: self.containerVw.trailingAnchor),
            
            submitAlert.bottomAnchor.constraint(equalTo: self.containerVw.bottomAnchor,constant: -10)
        ])
    }
    
    @objc func closevw(){
        self.dismiss(animated: false, completion: nil)
    }
    
    @objc func submit(){
        if(nicIp.text == ""){
            nicAlert.text = "Please Enter Your NIC Number"
        }
        if(nameIp.text == ""){
            nameAlert.text = "Please Enter Your Name"
        }
        if(ageIp.text == ""){
            ageAlert.text = "Please Enter Your Age"
        }

        if(nicIp.text != "" && nameIp.text != "" && ageIp.text != "" && gameName != nil){
//        if(ref.child("PLAYERS").child.self == nil){
            ref.child("PLAYERS").observeSingleEvent(of: .value, with: { snapshot in
                if let snapshot = snapshot.value as? Dictionary<String, Any> {
                    for snap in snapshot {
                        if(self.nicIp.text == snap.key){
                            self.nicCheck = true
                        }
                    }
                    if(self.nicCheck == false){
                        self.ref.child("PLAYERS").child(self.nicIp.text!).setValue(["NAME": self.nameIp.text!,"AGE":self.ageIp.text!,"GAME":self.gameName ])
                        
                        self.submitAlertState = true
                        
                        let vc = SubmitAlertViewController(currentSubmitAlertState : self.submitAlertState)
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc,animated: false)
                    }else{
                        self.submitAlertState = false
                        self.nicCheck = false
                        let vc = SubmitAlertViewController(currentSubmitAlertState : self.submitAlertState)
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc,animated: false)
                    }
                }
            })
//        }else{
//            self.ref.child("PLAYERS").child(self.nicIp.text!).setValue(["NAME": self.nameIp.text!,"AGE":self.ageIp.text!,"GAME":self.gameName ])
//
//            self.submitAlertState = true
//
//            let vc = SubmitAlertViewController(currentSubmitAlertState : self.submitAlertState)
//            vc.modalPresentationStyle = .fullScreen
//            self.present(vc,animated: false)
//        }

        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField){
        if(nicIp.text != ""){
            nicAlert.text = ""
        } else {
            nicAlert.text = "Please Enter Your NIC Number"
        }
        
        if(nameIp.text != ""){
            nameAlert.text = ""
        } else {
            nameAlert.text = "Please Enter Your Name"
        }

        if(ageIp.text != ""){
            ageAlert.text = ""
        } else {
            ageAlert.text = "Please Enter Your Age"
//            print("Text Fields are not validated, disable everything! ❌")
        }

        
//        print("Text Fields are validated, enable everything! ✅")
    }
}

extension UITextField {
    func isValid(with word: String) -> Bool {
        print(word)
        guard let text = self.text,
              !text.isEmpty else {
            print("Please fill the field.")
            return false
        }

        guard text.contains(word) else {
            print("Wrong word. Please check again.")
            return false
        }

        return true
    }
}
