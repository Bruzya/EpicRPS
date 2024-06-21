//
//  FightResultsController.swift
//  EpicRPS
//
//  Created by Evgenii Mazrukho on 21.06.2024.
//

import UIKit

final class FightResultsController: UIViewController {
    
    //MARK: - UI
    
    private let resultsBackgroundView = RPSImageView(image: .blueBackground)
    private let avatarBackgroundView = RPSImageView(image: .rectangle)
    private let secondPlayerScaleView = RPSImageView(image: .wrestler)
    private let gameStatusLabel = UILabel(font: .rubickBlack, fontSize: 21, color: .yelowPrimary)
    private let enemyScoreLabel = UILabel(font: .rubickBlack, fontSize: 41, color: .white)
    
    private lazy var homeButton = UIButton(image: .homebutton)
    private lazy var restartButton = UIButton(image: .restartbutton)
    
    
    //MARK: - Properties
    
    private let userScore = 0
    private let computerScore = 0
    
    private var gameState: GameState
    
    
    //MARK: - Lifecycle
    
    init(gameState: GameState) {
        
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
            let userScore = try? JSONDecoder().decode(PlayerScore.self, from: userData) {
                if gameState == .win {
                    gameStatusLabel.text = "You Win"
                    resultsBackgroundView.image = .blueBackground
                    secondPlayerScaleView.image = .wrestler
                    enemyScoreLabel.attributedText = setupLabel(first: String(userScore.victories), second: String(userScore.loses))
                }
            }
        
        
        if let computerData = UserDefaults.standard.object(forKey: "ComputerScore") as? Data,
            let computerScore = try? JSONDecoder().decode(PlayerScore.self, from: computerData) {
                if gameState == .lose {
                    gameStatusLabel.text = "You Lose"
                    resultsBackgroundView.image = .orangeBackground
                    secondPlayerScaleView.image = .alien
                    enemyScoreLabel.attributedText = setupLabel(first: String(computerScore.loses), second: String(computerScore.victories))
                }
            }
    }
    
    
    //MARK: - Setup UI
    
    func configure() {
        view.addSubviews(resultsBackgroundView, avatarBackgroundView,
                         secondPlayerScaleView, gameStatusLabel, enemyScoreLabel,
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
            resultsBackgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            resultsBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            resultsBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultsBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            avatarBackgroundView.heightAnchor.constraint(equalToConstant: 176),
            avatarBackgroundView.widthAnchor.constraint(equalToConstant: 176),
            avatarBackgroundView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            avatarBackgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 213),
            
            secondPlayerScaleView.heightAnchor.constraint(equalToConstant: 78.05),
            secondPlayerScaleView.widthAnchor.constraint(equalToConstant: 67.17),
            secondPlayerScaleView.centerXAnchor.constraint(equalTo: avatarBackgroundView.centerXAnchor),
            secondPlayerScaleView.centerYAnchor.constraint(equalTo: avatarBackgroundView.centerYAnchor),
            
            gameStatusLabel.topAnchor.constraint(equalTo: avatarBackgroundView.bottomAnchor, constant: 26),
            gameStatusLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            enemyScoreLabel.topAnchor.constraint(equalTo: gameStatusLabel.bottomAnchor, constant: 6),
            enemyScoreLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            homeButton.heightAnchor.constraint(equalToConstant: 52),
            homeButton.widthAnchor.constraint(equalToConstant: 67),
            homeButton.topAnchor.constraint(equalTo: enemyScoreLabel.bottomAnchor, constant: 34),
            homeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -21),
            
            restartButton.heightAnchor.constraint(equalToConstant: 52),
            restartButton.widthAnchor.constraint(equalToConstant: 67),
            restartButton.topAnchor.constraint(equalTo: enemyScoreLabel.bottomAnchor, constant: 34),
            restartButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 21)
        ])
    }
}
