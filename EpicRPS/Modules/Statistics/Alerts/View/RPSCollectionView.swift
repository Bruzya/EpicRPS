//
//  RPSCollectionView.swift
//  EpicRPS
//
//  Created by Evgenii Mazrukho on 30.06.2024.
//

import UIKit

final class RPSCollectionView: UICollectionView {
    
    //MARK: - Properties
    
    private let collectionLayout = UICollectionViewFlowLayout()
    
    private var avatars = [UIImage]()
    
    private let completion: (_ index: IndexPath) -> Void
    
    
    //MARK: - Lifecycle

    init(avatars: [UIImage], completion: @escaping ((_ index: IndexPath) -> Void)) {
        self.avatars = avatars
        self.completion = completion
        super.init(frame: .zero, collectionViewLayout: collectionLayout)

        configure()
        setDelegates()
        register(RPSCollectionViewCell.self,
                 forCellWithReuseIdentifier: RPSCollectionViewCell.idCell)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Internal Methods

private extension RPSCollectionView {
    func configure() {
        collectionLayout.minimumInteritemSpacing = 8
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func setDelegates() {
        delegate = self
        dataSource = self
    }
}


//MARK: - UICollectionViewDelegate

extension RPSCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        completion(indexPath)
    }
}


//MARK: - UICollectionViewDelegateFlowLayout

extension RPSCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: frame.width / 5, height: frame.width / 5)
    }
}


//MARK: - UICollectionViewDataSource

extension RPSCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        avatars.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RPSCollectionViewCell.idCell, for: indexPath) as? RPSCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: avatars[indexPath.item])
        
        return cell
    }
}
