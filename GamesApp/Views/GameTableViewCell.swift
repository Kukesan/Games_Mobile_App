//
//  GameTableViewCell.swift
//  GamesApp
//
//  Created by Ketheeswaran Kukesan on 2023-03-01.
//

import UIKit

protocol GameTableViewCellDelegate: class {
    func visible(for game :Game)
    func goTeamPlayers(for game:Game)
}

class GameTableViewCell: UITableViewCell {

    static let cellId = "GameTableViewCell"
    
    private lazy var containerView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.brown.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var contentStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.spacing = 5
        stackview.axis = .vertical
        return stackview
    }()
    
    private lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var noOfPlayerLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private lazy var isVacancyLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .heavy)
        label.textColor = .black
        return label
    }()
    
    private lazy var captainLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private lazy var gameImage : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.shadowColor = UIColor.brown.cgColor
        image.layer.shadowOpacity = 0.8
        image.layer.shadowOffset = CGSize.zero
        image.layer.shadowRadius = 5
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var gameButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .brown
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .regular)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var teamPlayerViewButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.brown, for: .normal)
        button.setTitle("View Players", for: .normal)
        button.addTarget(self, action: #selector(goTeamPlayers), for: .touchUpInside)
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .regular)
        return button
    }()
    
    private weak var delegate: GameTableViewCellDelegate?
    private var game: Game?
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.game = nil
        self.delegate = nil
        self.contentView.subviews.forEach{ $0.removeFromSuperview()}
    }

    func configure(with item: Game, delegate: GameTableViewCellDelegate){
        
        self.game = item
        self.delegate = delegate
        
        nameLabel.text = item.name.rawValue
        noOfPlayerLabel.text = "Number of Players : \(item.noOfPlayers)"
        isVacancyLabel.text = "Shall I Play Game : \(item.isVacancy ? "Yes":"No")"
        captainLabel.text = "Team Captain Name : \(item.captain.name)"
        gameImage.image = item.name.gamephoto
        
        gameButton.addTarget(self, action: #selector(visible), for: .touchUpInside)
        gameButton.setTitle(item.isVacancy ? "Enroll" : "Not Enroll", for: .normal)
        
        self.contentView.addSubview(containerView)
        
        containerView.addSubview(contentStackView)
        containerView.addSubview(gameImage)
        containerView.addSubview(nameLabel)
        containerView.addSubview(teamPlayerViewButton)
        
        contentStackView.addArrangedSubview(noOfPlayerLabel)
        contentStackView.addArrangedSubview(isVacancyLabel)
        contentStackView.addArrangedSubview(captainLabel)
        contentStackView.addArrangedSubview(gameButton)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            
            nameLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor,constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor,constant: -8),
            
            
            gameImage.heightAnchor.constraint(equalToConstant: 100),
            gameImage.widthAnchor.constraint(equalToConstant: 120),
            gameImage.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            gameImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            
            teamPlayerViewButton.topAnchor.constraint(equalTo: self.gameImage.bottomAnchor),
            teamPlayerViewButton.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 8),
            teamPlayerViewButton.heightAnchor.constraint(equalToConstant: 20),
            teamPlayerViewButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -8),
            
            contentStackView.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 8),
            contentStackView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -8),
            contentStackView.leadingAnchor.constraint(equalTo: self.gameImage.trailingAnchor, constant: 8),
            contentStackView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -8),
            
            noOfPlayerLabel.heightAnchor.constraint(equalToConstant: 20),
            noOfPlayerLabel.topAnchor.constraint(equalTo: self.contentStackView.topAnchor),
            noOfPlayerLabel.leadingAnchor.constraint(equalTo: self.contentStackView.leadingAnchor, constant: 8),
            noOfPlayerLabel.trailingAnchor.constraint(equalTo: self.contentStackView.trailingAnchor),

            isVacancyLabel.heightAnchor.constraint(equalToConstant: 20),
            isVacancyLabel.topAnchor.constraint(equalTo: self.noOfPlayerLabel.bottomAnchor),
            isVacancyLabel.leadingAnchor.constraint(equalTo: self.contentStackView.leadingAnchor, constant: 8),
            isVacancyLabel.trailingAnchor.constraint(equalTo: self.contentStackView.trailingAnchor),

            captainLabel.heightAnchor.constraint(equalToConstant: 20),
            captainLabel.topAnchor.constraint(equalTo: self.isVacancyLabel.bottomAnchor),
            captainLabel.leadingAnchor.constraint(equalTo: self.contentStackView.leadingAnchor, constant: 8),
            
            gameButton.topAnchor.constraint(equalTo: self.captainLabel.bottomAnchor,constant: 8),
            gameButton.leadingAnchor.constraint(equalTo: self.contentStackView.leadingAnchor, constant: 8),
            gameButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -20),
            
        ])
        
    }
    
    @objc func visible(){
        if let game = game {
            delegate?.visible(for: game)
        }
    }
    
    @objc func goTeamPlayers(){
        if let game = game {
            delegate?.goTeamPlayers(for: game)
        }
    }
}
