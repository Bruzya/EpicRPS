//
//  RPSConfirmButton.swift
//  EpicRPS
//
//  Created by Evgenii Mazrukho on 30.06.2024.
//

import UIKit

final class RPSConfirmButton: UIButton {
    
    //MARK: - Properties
    
    var completion: () -> Void
    
    
    //MARK: - Lifecycle
    
    init(completion: @escaping () -> Void) {
        self.completion = completion
        super.init(frame: .zero)
        
        configure()
    }
        
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Internal Methods

private extension RPSConfirmButton {
    func configure() {
        addAction(UIAction(handler: { [weak self] _ in
            self?.completion()
        }), for: .touchUpInside)
        
        setTitle("OK", for: .normal)
        titleLabel?.font = Font.getFont(.rubickBold, size: 16)
        backgroundColor = .brownBase
        layer.cornerRadius = 20
        translatesAutoresizingMaskIntoConstraints = false
    }
}
