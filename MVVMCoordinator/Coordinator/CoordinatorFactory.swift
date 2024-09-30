//
//  CoordinatorFactory.swift
//  MVVMCoordinator
//
//  Created by YoncaYeprem on 18.09.2024.
//

import Foundation
import UIKit

protocol CoordinatorFactory {
    func createAuthCoordinator(navigationController: UINavigationController) -> AuthCoordinator
    func createTabCoordinator(navigationController: UINavigationController) -> TabCoordinator
}

class AppCoordinatorFactory: CoordinatorFactory {
    func createAuthCoordinator(navigationController: UINavigationController) -> AuthCoordinator {
        return AuthCoordinator(navigationController: navigationController)
    }

    func createTabCoordinator(navigationController: UINavigationController) -> TabCoordinator {
        return TabCoordinator(navigationController: navigationController)
    }
}
