//
//  RegisterViewController.swift
//  MVVMCoordinator
//
//  Created by YoncaYeprem on 18.09.2024.
//

import UIKit

class RegisterViewController: UIViewController {
    
    weak var coordinator : AuthCoordinator?
    
    var loginBtn : UIButton = {
        var button = UIButton()
        button.setTitle("GO TO LOGIN", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
        view.addSubview(loginBtn)
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginBtn.widthAnchor.constraint(equalToConstant: 200),
            loginBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        loginBtn.addTarget(self, action: #selector(didTapLoginButton(_:)), for: .touchUpInside)
    }
    
    @objc private func didTapLoginButton(_ sender: Any) {
        coordinator?.popToLogin()
    }
    
}
