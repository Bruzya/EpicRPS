//
//  RPSCollectionViewCell.swift
//  EpicRPS
//
//  Created by Evgenii Mazrukho on 30.06.2024.
//

import UIKit

final class RPSCollectionViewCell: UICollectionViewCell {
    
    //MARK: - UI
    
    private let avatarImageView = RPSImageView(use: .wrestler)
    
    private let checkmarkImageView: UIImageView = {
        $0.image = .checkbox
        $0.tintColor = .greenLighter
        $0.isHidden = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    
    //MARK: - Properties
    
    static let idCell = "RPSCollectionViewCell"
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                backgroundColor = .greenBase
                checkmarkImageView.isHidden = false
            } else {
                backgroundColor = .greyLighter
                checkmarkImageView.isHidden = true
            }
        }
    }
    
    
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


//MARK: - External Methods

extension RPSCollectionViewCell {
    func configure(with avatar: UIImage) {
        avatarImageView.image = avatar
    }
}


//MARK: - Internal Methods

private extension RPSCollectionViewCell {
    func configure() {
        backgroundColor = .greyLighter
        layer.cornerRadius = 20
        
        addSubviews(avatarImageView, checkmarkImageView)
    }
    
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 30),
            avatarImageView.widthAnchor.constraint(equalToConstant: 26),
            
            checkmarkImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6),
            checkmarkImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
            checkmarkImageView.heightAnchor.constraint(equalToConstant: 8),
            checkmarkImageView.widthAnchor.constraint(equalToConstant: 10)
        ])
    }
}
