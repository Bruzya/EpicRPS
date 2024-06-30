//
//  RPSUserNameTextField.swift
//  EpicRPS
//
//  Created by Evgenii Mazrukho on 29.06.2024.
//

import UIKit

final class RPSUserNameTextFieldAlert: UIViewController {
    
    //MARK: - UI
    
    private let nameLabel = UILabel(text: "Введите имя игрока",
                                    font: .rubickRegular,
                                    fontSize: 14,
                                    color: .greyDarker,
                                    textAlignment: .left)
    
    private lazy var userNameTextField: UITextField = {
       let txtFld = UITextField()
        txtFld.placeholder = "Username"
        txtFld.layer.cornerRadius = 20
        txtFld.layer.borderColor = UIColor.greyLight.cgColor
        txtFld.layer.borderWidth = 0.5
        txtFld.textColor = .greyBlack
        txtFld.font = Font.getFont(.rubickBold, size: 16)
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        txtFld.leftView = leftView
        txtFld.leftViewMode = .always
        txtFld.translatesAutoresizingMaskIntoConstraints = false
        return txtFld
    }()
    
    private let containerView: UIView = {
        $0.backgroundColor = .systemBackground
        $0.layer.cornerRadius = 23
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())

    private lazy var okButton = RPSConfirmButton { [weak self] in
        self?.dismiss(animated: true)
    }
    
    
    //MARK: - Properties
    
    private let completion: (String) -> Void
    
    
    //MARK: - Lifecycle
   
    init(completion: @escaping (String) -> Void) {
        self.completion = completion
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setCOnstraints()
        userNameTextField.delegate = self
    }
}


//MARK: - TextField Delegate

extension RPSUserNameTextFieldAlert: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
            completion(textField.text!)
    }
}


//MARK: - Internal Methods

private extension RPSUserNameTextFieldAlert {
    func configure() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        
        view.addSubviews(containerView)
        containerView.addSubviews(nameLabel, userNameTextField, okButton)
    }
    
    
    func setCOnstraints() {
        NSLayoutConstraint.activate([
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 140),
        containerView.heightAnchor.constraint(equalToConstant: 200),
        containerView.widthAnchor.constraint(equalToConstant: 315),
        
        nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
        nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
        nameLabel.widthAnchor.constraint(equalToConstant: 140),
        
        userNameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
        userNameTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
        userNameTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
        userNameTextField.heightAnchor.constraint(equalToConstant: 45),
        
        okButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        okButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
        okButton.heightAnchor.constraint(equalToConstant: 40),
        okButton.widthAnchor.constraint(equalToConstant: 140)
        ])
    }
}
