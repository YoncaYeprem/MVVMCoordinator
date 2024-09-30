//
//  AppCoordinator.swift
//  MVVMCoordinator
//
//  Created by YoncaYeprem on 18.09.2024.
//

import Foundation
import UIKit

class AppCoordinator : Coordinator {
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    weak var finishDelegate: CoordinatorFinishDelegate?
    var factory: CoordinatorFactory
    var coordinatorType: CoordinatorTypeEnum = .app
    
    init(navigationController: UINavigationController, factory: CoordinatorFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func finish() {
           finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
    
    func start() {
        showAuthFlow()
    }
    
    func showAuthFlow(){
        let authCoordinator = factory.createAuthCoordinator(navigationController: navigationController)
        addChildCoordinator(authCoordinator)
        authCoordinator.finishDelegate = self
        authCoordinator.start()
    }
    
    func showMainFlow(){
        let mainCoordinator = factory.createTabCoordinator(navigationController: navigationController)
        addChildCoordinator(mainCoordinator)
        mainCoordinator.finishDelegate = self
        mainCoordinator.start()
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {

        removeChildCoordinator(childCoordinator)
                
        switch childCoordinator.coordinatorType {
        case .auth:
            showMainFlow()
        case .tab:
            showAuthFlow()
        default:
            break
        }
    }
}
