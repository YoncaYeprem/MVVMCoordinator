//
//  SettingsCoordinator.swift
//  MVVMCoordinator
//
//  Created by YoncaYeprem on 18.09.2024.
//

import Foundation
import UIKit

class SettingsCoordinator : Coordinator {
    var navigationController: UINavigationController
    weak var finishDelegate: CoordinatorFinishDelegate?
    var childCoordinators = [Coordinator]()
    var coordinatorType: CoordinatorTypeEnum = .tab

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("SettingsCoordinator deinit")
    }
    
    func start() {
        let settingsViewController = SettingsViewController()
        settingsViewController.coordinator = self
        navigationController.pushViewController(settingsViewController, animated: true)
    }
    
    func logout(){
        self.finish()
    }
}
