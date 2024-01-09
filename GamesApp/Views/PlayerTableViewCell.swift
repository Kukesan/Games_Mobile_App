//
//  PlayerTableViewCell.swift
//  GamesApp
//
//  Created by Ketheeswaran Kukesan on 2023-03-14.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {

    static let cellId = "PlayerTableViewCell"
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.player = nil
        self.contentView.subviews.forEach{ $0.removeFromSuperview()}
    }
    
    private lazy var containerView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.brown.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var contentStackVw : UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.spacing = 4
        stackview.axis = .vertical
        return stackview
    }()
    
    private lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private lazy var nicLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private lazy var ageLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private lazy var gameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private var player : Player?
    
    func configure(with item: Player){
        
        self.player = item
        
        nicLabel.text = "NIC : \(item.nic)"
        nameLabel.text = "Name : \(item.name)"
        ageLabel.text = "Age : \(item.age)"
        gameLabel.text = "Enroll Game : \(item.game)"
        
        self.contentView.addSubview(containerView)
        
        containerView.addSubview(nicLabel)
        containerView.addSubview(nameLabel)
        containerView.addSubview(ageLabel)
        containerView.addSubview(gameLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            
            nameLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor,constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor,constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor,constant: -8),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            nicLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor,constant: 8),
            nicLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor,constant: 8),
            nicLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor,constant: -8),
            nicLabel.heightAnchor.constraint(equalToConstant: 20),
            
            ageLabel.topAnchor.constraint(equalTo: self.nicLabel.bottomAnchor,constant: 8),
            ageLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor,constant: 8),
            ageLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor,constant: -8),
            ageLabel.heightAnchor.constraint(equalToConstant: 20),
            
            gameLabel.topAnchor.constraint(equalTo: self.ageLabel.bottomAnchor,constant: 8),
            gameLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor,constant: 8),
            gameLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor,constant: -8),
            gameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            gameLabel.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor)
        ])
    }
}
