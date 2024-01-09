//
//  LandingViewController.swift
//  GamesApp
//
//  Created by Ketheeswaran Kukesan on 2023-03-02.
//

import UIKit
import FirebaseAuth

class LandingViewController: UIViewController {
    weak var shapeLayer: CAShapeLayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        vectorDrawing()
    }
  
    override func loadView() {
        super.loadView()
        configure()
        self.view.backgroundColor = .white
    }
    
    private lazy var landingVw : UIView = {
       let luv = UIView()
        luv.translatesAutoresizingMaskIntoConstraints = false
        return luv
    }()
    
    private lazy var logoimg : UIImageView = {
        let logoimg = UIImageView()
        logoimg.translatesAutoresizingMaskIntoConstraints = false
        logoimg.image = UIImage(named: "logo")
        return logoimg
    }()
    
    private lazy var startBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Get Started", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .brown
        btn.layer.cornerRadius = 5
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOpacity = 0.8
        btn.layer.shadowOffset = CGSize.zero
        btn.layer.shadowRadius = 6
        return btn
    }()
    
    func configure(){
        
        startBtn.addTarget(self, action: #selector(nav), for: .touchUpInside)
        
        self.view.addSubview(landingVw)
        
        landingVw.addSubview(logoimg)
        landingVw.addSubview(startBtn)
        
        NSLayoutConstraint.activate([
            landingVw.topAnchor.constraint(equalTo: self.view.topAnchor),
            landingVw.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            landingVw.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            landingVw.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            logoimg.topAnchor.constraint(equalTo: landingVw.topAnchor, constant: 200),
            logoimg.leadingAnchor.constraint(equalTo: landingVw.leadingAnchor,constant: 30),
            logoimg.trailingAnchor.constraint(equalTo: landingVw.trailingAnchor,constant: -30),
            logoimg.heightAnchor.constraint(equalToConstant: 300),
            
            startBtn.topAnchor.constraint(equalTo: self.logoimg.bottomAnchor, constant: 50),
            startBtn.heightAnchor.constraint(equalToConstant: 40),
            startBtn.leadingAnchor.constraint(equalTo: landingVw.leadingAnchor,constant: 80),
            startBtn.trailingAnchor.constraint(equalTo: landingVw.trailingAnchor,constant: -80)
        ])
    }

    @objc func nav(){
        if isUserLoggedIn() {
            let vc = FullGamesViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc , animated: false)
        } else {
            let vc = AuthenticationViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc , animated: false)
        }
    }
    
    
    func isUserLoggedIn() -> Bool {
        return Auth.auth().currentUser != nil
    }
    
    func vectorDrawing(){
        self.shapeLayer?.removeFromSuperlayer()

           // create whatever path you want

           let path = UIBezierPath()
        let xc =  self.view.center.x
        let yc = self.view.center.y
            path.move(to: CGPoint(x: self.view.center.x-120, y: 500))
           path.addLine(to: CGPoint(x: self.view.center.x+120, y: 500))
        path.move(to: CGPoint(x: 20, y: 20))
        
//        path.addArc(withCenter: CGPoint(x:xc, y: yc-150 ), radius: 30, startAngle: 0, endAngle: .pi * 2, clockwise: true)
//
//        path.move(to: CGPoint(x: xc-100, y: yc-150))
//        path.addCurve(to: CGPoint(x: xc+100, y: yc-150), controlPoint1: CGPoint(x: xc-50, y: yc-90), controlPoint2: CGPoint(x: xc+50, y: yc-90))
//        path.addCurve(to: CGPoint(x: xc+110, y: yc-140), controlPoint1: CGPoint(x: xc+140, y: yc-190), controlPoint2: CGPoint(x: xc+130, y: yc-160))
//        path.addCurve(to: CGPoint(x: xc+80, y: yc+80), controlPoint1: CGPoint(x: xc+40, y: yc-80), controlPoint2: CGPoint(x: xc+40, y: yc-40))
//        path.addCurve(to: CGPoint(x: xc+60, y: yc+80), controlPoint1: CGPoint(x: xc+80, y: yc+100), controlPoint2: CGPoint(x: xc+60, y: yc+100))
        
        
           // create shape layer for that path

           let shapeLayer = CAShapeLayer()
           shapeLayer.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        shapeLayer.strokeColor = UIColor.brown.cgColor
           shapeLayer.lineWidth = 5
           shapeLayer.path = path.cgPath

           // animate it

           view.layer.addSublayer(shapeLayer)
           let animation = CABasicAnimation(keyPath: "strokeEnd")
           animation.fromValue = 0
           animation.duration = 2
           shapeLayer.add(animation, forKey: "MyAnimation")

           // save shape layer

           self.shapeLayer = shapeLayer
    }
}
