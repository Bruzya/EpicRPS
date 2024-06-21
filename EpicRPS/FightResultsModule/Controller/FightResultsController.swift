//
//  FightResultsController.swift
//  EpicRPS
//
//  Created by Evgenii Mazrukho on 21.06.2024.
//

import UIKit

final class FightResultsController: UIViewController {
    
    //MARK: - UI
    
    private let backgroundView = RPSImageView(use: .blueBackground)
    private let avatarBackgroundView = RPSImageView(use: .rectangle)
    private lazy var playerImageView = RPSImageView(frame: .zero)
    private let gameStatusLabel = UILabel(font: .rubickBlack, fontSize: 21, color: .yelowPrimary)
    private let scoreLabel = UILabel(font: .rubickBlack, fontSize: 41, color: .white)
    
    private lazy var homeButton = UIButton(image: .homebutton)
    private lazy var restartButton = UIButton(image: .restartbutton)
    
    
    //MARK: - Properties
    
    private let userScore = 0
    private let computerScore = 0
    
    private let gameState: GameState
    private let user: Player
    private let computer: Player
    
    
    //MARK: - Lifecycle
    
    init(firstPlayer: Player, secondPlayer: Player, gameState: GameState) {
        self.user = firstPlayer
        self.computer = secondPlayer
        self.gameState = gameState
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setupButtons()
        setConstraints()
        getDataFromStorage()
    }
}


//MARK: - Internal Methods

private extension FightResultsController {
    
    //MARK: - Actions / Navigation
    
    @objc func homeButtonPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    @objc func restartButtonPressed(_ sender: UIButton) {
        let gameVC = GameViewController()
        navigationController?.pushViewController(gameVC, animated: true)
    }
    
    
    //MARK: - Data Storage
    
    func getDataFromStorage() {
        if let userData = UserDefaults.standard.object(forKey: "UserScore") as? Data,
            let userScore = try? JSONDecoder().decode(Player.self, from: userData) {
                if gameState == .win {
                    gameStatusLabel.text = "You Win"
                    backgroundView.image = .blueBackground
                    playerImageView.image = user.avatar
                    scoreLabel.attributedText = setupLabel(first: String(userScore.victories), second: String(userScore.loses))
                }
            }
        
        
        if let computerData = UserDefaults.standard.object(forKey: "ComputerScore") as? Data,
            let computerScore = try? JSONDecoder().decode(Player.self, from: computerData) {
                if gameState == .lose {
                    gameStatusLabel.text = "You Lose"
                    backgroundView.image = .orangeBackground
                    playerImageView.image = user.avatar
                    scoreLabel.attributedText = setupLabel(first: String(computerScore.loses), second: String(computerScore.victories))
                }
            }
    }
    
    
    //MARK: - Setup UI
    
    func configure() {
        view.addSubviews(backgroundView, avatarBackgroundView,
                         playerImageView, gameStatusLabel, scoreLabel,
                         homeButton, restartButton)
    }
    
    
    func setupLabel(first: String, dash: String = " - ", second: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString()
        
        attributedString.append(NSAttributedString(string: first))
        attributedString.append(NSAttributedString(string: dash))
        attributedString.append(NSAttributedString(string: second))
        
        return attributedString
    }
    
    
    func setupButtons() {
        homeButton.addTarget(self, action: #selector(homeButtonPressed), for: .touchUpInside)
        restartButton.addTarget(self, action: #selector(restartButtonPressed), for: .touchUpInside)
    }
    
    
    //MARK: - Constraints
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            avatarBackgroundView.heightAnchor.constraint(equalToConstant: 176),
            avatarBackgroundView.widthAnchor.constraint(equalToConstant: 176),
            avatarBackgroundView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            avatarBackgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 213),
            
            playerImageView.heightAnchor.constraint(equalToConstant: 78.05),
            playerImageView.widthAnchor.constraint(equalToConstant: 67.17),
            playerImageView.centerXAnchor.constraint(equalTo: avatarBackgroundView.centerXAnchor),
            playerImageView.centerYAnchor.constraint(equalTo: avatarBackgroundView.centerYAnchor),
            
            gameStatusLabel.topAnchor.constraint(equalTo: avatarBackgroundView.bottomAnchor, constant: 26),
            gameStatusLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            scoreLabel.topAnchor.constraint(equalTo: gameStatusLabel.bottomAnchor, constant: 6),
            scoreLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            homeButton.heightAnchor.constraint(equalToConstant: 52),
            homeButton.widthAnchor.constraint(equalToConstant: 67),
            homeButton.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 34),
            homeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -21),
            
            restartButton.heightAnchor.constraint(equalToConstant: 52),
            restartButton.widthAnchor.constraint(equalToConstant: 67),
            restartButton.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 34),
            restartButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 21)
        ])
    }
}