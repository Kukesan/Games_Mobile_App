//
//  EnrollAlertViewController.swift
//  GamesApp
//
//  Created by Ketheeswaran Kukesan on 2023-03-16.
//

import UIKit

class EnrollAlertViewController: UIViewController {
    
    var gameName : Any = ""
    
    init(gameName : Any){
        super.init(nibName: nil, bundle: nil)
        self.gameName = gameName 
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
    
    private lazy var enrollalertviewcontainer : UIView = {
       let enalvc = UIView()
        enalvc.translatesAutoresizingMaskIntoConstraints = false
        enalvc.backgroundColor = .white
        enalvc.layer.cornerRadius = 10
        enalvc.layer.shadowRadius = 10
        return enalvc
    }()
    
    private lazy var enrollalerthead : UILabel = {
       let head = UILabel()
        head.translatesAutoresizingMaskIntoConstraints = false
        head.textColor = .black
        head.textAlignment = .center
        head.font = UIFont.boldSystemFont(ofSize: 20.0)
        return head
    }()
    
    private lazy var enrollalertsubject : UILabel = {
        let sub = UILabel()
        sub.translatesAutoresizingMaskIntoConstraints = false
        sub.textAlignment = .center
        sub.numberOfLines = 2
        sub.font = UIFont.systemFont(ofSize: 14.0, weight: .light)
        return sub
    }()
    
    private lazy var enrollimg : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var addbtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .brown
        btn.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        btn.titleLabel?.textColor = .white
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    private lazy var closebtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        return btn
    }()
    
    func configure(){
        
        enrollalerthead.text = "Welcome to Our Team"
        enrollalertsubject.text = "Please Consider One person can only Enroll One Game"
        enrollimg.image = UIImage(named: "hire.jpeg")
        
        addbtn.setTitle("Add Info", for: .normal)
        addbtn.addTarget(self, action: #selector(addinfo), for: .touchUpInside)
        
        closebtn.setImage(UIImage(named: "close-icon.jpeg"), for: .normal)
        closebtn.addTarget(self, action: #selector(closevw), for: .touchUpInside)
        
        self.view.addSubview(enrollalertviewcontainer)
        self.enrollalertviewcontainer.addSubview(enrollalerthead)
        self.enrollalertviewcontainer.addSubview(enrollalertsubject)
        self.enrollalertviewcontainer.addSubview(enrollimg)
        self.enrollalertviewcontainer.addSubview(addbtn)
        self.enrollalertviewcontainer.addSubview(closebtn)
        
        NSLayoutConstraint.activate([
            enrollalertviewcontainer.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 200),
            enrollalertviewcontainer.bottomAnchor.constraint(equalTo: self.enrollalertsubject.bottomAnchor,constant: 10),
            enrollalertviewcontainer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 10),
            enrollalertviewcontainer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -10),
            
            enrollalerthead.topAnchor.constraint(equalTo: self.enrollalertviewcontainer.topAnchor,constant: 10),
            enrollalerthead.leadingAnchor.constraint(equalTo: self.enrollalertviewcontainer.leadingAnchor),
            enrollalerthead.trailingAnchor.constraint(equalTo: self.enrollalertviewcontainer.trailingAnchor),
            
            closebtn.trailingAnchor.constraint(equalTo: self.enrollalertviewcontainer.trailingAnchor,constant: -10),
            closebtn.topAnchor.constraint(equalTo: self.enrollalertviewcontainer.topAnchor,constant: 10),
            closebtn.heightAnchor.constraint(equalToConstant: 20),
            closebtn.widthAnchor.constraint(equalToConstant: 20),
            
            enrollimg.topAnchor.constraint(equalTo: self.enrollalerthead.bottomAnchor,constant: 15),
            enrollimg.leadingAnchor.constraint(equalTo: self.enrollalertviewcontainer.leadingAnchor,constant: 120),
            enrollimg.trailingAnchor.constraint(equalTo: self.enrollalertviewcontainer.trailingAnchor,constant: -120),
            enrollimg.heightAnchor.constraint(equalToConstant: 140),
            
            addbtn.topAnchor.constraint(equalTo: self.enrollimg.bottomAnchor,constant: 15),
            addbtn.leadingAnchor.constraint(equalTo: self.enrollalertviewcontainer.leadingAnchor,constant: 100),
            addbtn.trailingAnchor.constraint(equalTo: self.enrollalertviewcontainer.trailingAnchor,constant: -100),
            
            enrollalertsubject.topAnchor.constraint(equalTo: self.addbtn.bottomAnchor,constant: 15),
            enrollalertsubject.leadingAnchor.constraint(equalTo: self.enrollalertviewcontainer.leadingAnchor),
            enrollalertsubject.trailingAnchor.constraint(equalTo: self.enrollalertviewcontainer.trailingAnchor),
        ])
    }
    
    @objc func closevw(){
        self.dismiss(animated: false, completion: nil)
    }
    
    @objc func addinfo(){
        let vc = AddPlayerViewController(gameName : self.gameName)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc,animated: false)
    }
}
