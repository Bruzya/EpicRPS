import UIKit

final class FightLooseResultsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fightLooseResultsView()
        
    }
    
    private func fightLooseResultsView(){
        
        let resultsBackgroundView = UIImageView(image: .orangeBackground)
        resultsBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultsBackgroundView)
        resultsBackgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        resultsBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        resultsBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        resultsBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        let avatarBackgroundView = UIImageView(image: .rectangle)
        avatarBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(avatarBackgroundView)
        avatarBackgroundView.heightAnchor.constraint(equalToConstant: 176).isActive = true
        avatarBackgroundView.widthAnchor.constraint(equalToConstant: 176).isActive = true
        avatarBackgroundView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        avatarBackgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 213).isActive = true
        
        let secondPlayerScaleView = UIImageView(image: .alien)
        secondPlayerScaleView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(secondPlayerScaleView)
        secondPlayerScaleView.heightAnchor.constraint(equalToConstant: 78.05).isActive = true
        secondPlayerScaleView.widthAnchor.constraint(equalToConstant: 67.17).isActive = true
        secondPlayerScaleView.centerXAnchor.constraint(equalTo: avatarBackgroundView.centerXAnchor).isActive = true
        secondPlayerScaleView.centerYAnchor.constraint(equalTo: avatarBackgroundView.centerYAnchor).isActive = true
        
        let gameStatusLabel = UILabel()
        gameStatusLabel.text = "You Lose"
        gameStatusLabel.textColor = .yelowPrimary
        gameStatusLabel.font =  UIFont(name: "Rubik-Black", size: 21)
        gameStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gameStatusLabel)
        gameStatusLabel.topAnchor.constraint(equalTo: avatarBackgroundView.bottomAnchor, constant: 26).isActive = true
        gameStatusLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        let enemyScoreLabel = UILabel()
        enemyScoreLabel.text = "2 - 3"
        enemyScoreLabel.textColor = .white
        enemyScoreLabel.font =  UIFont(name: "Rubik-Black", size: 41)
        enemyScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(enemyScoreLabel)
        enemyScoreLabel.topAnchor.constraint(equalTo: gameStatusLabel.bottomAnchor, constant: 6).isActive = true
        enemyScoreLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    
        
        let homeButton = UIButton()
        homeButton.setBackgroundImage(.homebutton, for: .normal)
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(homeButton)
        homeButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        homeButton.widthAnchor.constraint(equalToConstant: 67).isActive = true
        homeButton.topAnchor.constraint(equalTo: enemyScoreLabel.bottomAnchor, constant: 34).isActive = true
        homeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -21).isActive = true
        
        let restartButton = UIButton()
        restartButton.setBackgroundImage(.restartbutton, for: .normal)
        restartButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(restartButton)
        restartButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        restartButton.widthAnchor.constraint(equalToConstant: 67).isActive = true
        restartButton.topAnchor.constraint(equalTo: enemyScoreLabel.bottomAnchor, constant: 34).isActive = true
        restartButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 21).isActive = true
    }
}