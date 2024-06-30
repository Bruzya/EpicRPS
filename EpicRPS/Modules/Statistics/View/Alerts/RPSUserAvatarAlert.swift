//
//  RPSUserAvatarAlert.swift
//  EpicRPS
//
//  Created by Evgenii Mazrukho on 29.06.2024.
//

import UIKit

final class RPSUserAvatarAlert: UIViewController {
    
    //MARK: - UI
    
    private lazy var collectionView = RPSCollectionView()
    private lazy var okButton = RPSConfirmButton { [weak self] in
        self?.dismiss(animated: true)
    }
    
    
    private let containerView: UIView = {
        $0.backgroundColor = .systemBackground
        $0.layer.cornerRadius = 23
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    private let backgroundView: UIView = {
        $0.backgroundColor = .whiteDarker
        $0.layer.cornerRadius = 23
        $0.layer.borderWidth = 1.5
        $0.layer.borderColor = UIColor.greyLighter.cgColor
        $0.layer.cornerRadius = 28
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    

    //MARK: - Properties
    
    private lazy var avatars: [UIImage] = [.wrestler, .happyWrestler, .sadWrestler, .lightning, .marvelWrestler, .scissorsHand, .dcWrestler, .alien]

    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        configure()
        setCostraints()
    }
}


//MARK: - Internal Methods

private extension RPSUserAvatarAlert {
    func configureCollectionView() {
        collectionView = RPSCollectionView(avatars: avatars)
    }
    
    
    func configure() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        
        view.addSubviews(containerView)
        containerView.addSubviews(backgroundView, collectionView, okButton)
    }
    
    
    func setCostraints() {
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 140),
            containerView.heightAnchor.constraint(equalToConstant: 330),
            containerView.widthAnchor.constraint(equalToConstant: 315),
            
            
            backgroundView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            backgroundView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            backgroundView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            backgroundView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -120),
            
            
            collectionView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 25),
            collectionView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -25),
            
            
            okButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            okButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -35),
            okButton.heightAnchor.constraint(equalToConstant: 40),
            okButton.widthAnchor.constraint(equalToConstant: 140)
        ])
    }
}
