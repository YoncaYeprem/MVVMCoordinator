//
//  AuthCoordinator.swift
//  MVVMCoordinator
//
//  Created by YoncaYeprem on 18.09.2024.
//

import Foundation
import UIKit

class AuthCoordinator : Coordinator {
    
    var navigationController: UINavigationController
    weak var finishDelegate: CoordinatorFinishDelegate?
    var coordinatorType: CoordinatorTypeEnum = .auth
    var childCoordinators = [Coordinator]()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("AuthCoordinator deinit")
    }
    
    func start() {
       showLogin()

    }
    
    func showLogin(){
        let loginViewController = LoginViewController()
        loginViewController.coordinator = self
        navigationController.pushViewController(loginViewController, animated: true)
    }
    
    func showRegister(){
        let registerViewController = RegisterViewController()
        registerViewController.coordinator = self
        navigationController.pushViewController(registerViewController, animated: true)
    }
    
    func popToLogin(){
        navigationController.popViewController(animated: true)
    }
    
    func showMainTab(){
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}
