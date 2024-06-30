//
//  RPSUserView.swift
//  EpicRPS
//
//  Created by Evgenii Mazrukho on 29.06.2024.
//

import UIKit

final class RPSUserView: UIView {

    //MARK: - UI
    
    private let userAvatarBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 23
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public lazy var userAvatarButton: UIButton = {
        let btn = UIButton()
        btn.setImage(.wrestler, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    public lazy var userNameButton: UIButton = {
        $0.setTitle("Username", for: .normal)
        $0.setTitleColor(.blueLight, for: .normal)
        $0.titleLabel?.font = Font.getFont(.rubickBold, size: 16)
        $0.contentHorizontalAlignment = .center
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
        setConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Internal Methods

private extension RPSUserView {
    func configure() {
        addSubviews(userAvatarBackgroundView,
                    userAvatarButton,
                    userNameButton)
        
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            userAvatarBackgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            userAvatarBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            userAvatarBackgroundView.heightAnchor.constraint(equalToConstant: 46),
            userAvatarBackgroundView.widthAnchor.constraint(equalToConstant: 46),
            
            userAvatarButton.centerXAnchor.constraint(equalTo: userAvatarBackgroundView.centerXAnchor),
            userAvatarButton.centerYAnchor.constraint(equalTo: userAvatarBackgroundView.centerYAnchor),
            userAvatarButton.heightAnchor.constraint(equalToConstant: 40),
            userAvatarButton.widthAnchor.constraint(equalToConstant: 34),
            
            userNameButton.centerYAnchor.constraint(equalTo: userAvatarBackgroundView.centerYAnchor),
            userNameButton.leadingAnchor.constraint(equalTo: userAvatarBackgroundView.trailingAnchor, constant: 10),
            userNameButton.heightAnchor.constraint(equalToConstant: 20),
            userNameButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}

