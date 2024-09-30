//
//  ViewController.swift
//  MVVMCoordinator
//
//  Created by YoncaYeprem on 18.09.2024.
//

import UIKit

class LoginViewController: UIViewController {
    weak var coordinator: AuthCoordinator?
    
    var registerBtn : UIButton = {
        var button = UIButton()
        button.setTitle("GO TO REGISTER", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    var homeBtn : UIButton = {
        var button = UIButton()
        button.setTitle("GO TO HOME", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(registerBtn)
        view.addSubview(homeBtn)
        registerBtn.translatesAutoresizingMaskIntoConstraints = false
        homeBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            registerBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            registerBtn.widthAnchor.constraint(equalToConstant: 200),
            registerBtn.heightAnchor.constraint(equalToConstant: 50),
            
            homeBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            homeBtn.topAnchor.constraint(equalTo: registerBtn.bottomAnchor, constant: 16),
            homeBtn.widthAnchor.constraint(equalToConstant: 200),
            homeBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        registerBtn.addTarget(self, action: #selector(didTapRegisterButton(_:)), for: .touchUpInside)
        homeBtn.addTarget(self, action: #selector(didTapHomeButton(_:)), for: .touchUpInside)
    }
    
    @objc private func didTapRegisterButton(_ sender: Any) {
        coordinator?.showRegister()
    }
    
    @objc private func didTapHomeButton(_ sender: Any) {
        coordinator?.showMainTab()
    }
    
}

