//
//  HomeCoordinator.swift
//  MVVMCoordinator
//
//  Created by YoncaYeprem on 18.09.2024.
//

import Foundation
import UIKit

class HomeCoordinator : Coordinator {
    var navigationController: UINavigationController
    weak var finishDelegate: CoordinatorFinishDelegate?
    var coordinatorType: CoordinatorTypeEnum = .tab
    var childCoordinators = [Coordinator]()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("HomeCoordinator deinit")
    }
    
    func start() {
        let homeViewController = HomeViewController()
        navigationController.pushViewController(homeViewController, animated: true)
    }
}
