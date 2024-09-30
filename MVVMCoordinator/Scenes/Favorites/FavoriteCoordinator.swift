//
//  FavoriteCoordinator.swift
//  MVVMCoordinator
//
//  Created by YoncaYeprem on 18.09.2024.
//

import Foundation
import UIKit

class FavoriteCoordinator : Coordinator {
    
    var navigationController: UINavigationController
    weak var finishDelegate: CoordinatorFinishDelegate?
    var coordinatorType: CoordinatorTypeEnum = .tab

    var childCoordinators =  [Coordinator]()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let favoritesViewController = FavoritesViewController()
        navigationController.pushViewController(favoritesViewController, animated: true)
    }
    
    
}
