//
//  MainTabbar.swift
//  MVVMCoordinator
//
//  Created by YoncaYeprem on 18.09.2024.
//

import Foundation
import UIKit

enum TabBarPage {
    case home
    case favorites
    case settings
    
    func pageOrderNumber() -> Int {
        switch self {
        case .home:
            return 0
        case .favorites:
            return 1
        case .settings:
            return 2
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .home:
            return "Home"
        case .favorites:
            return "Favorites"
        case .settings:
            return "Settings"
        }
    }
    
    func pageTabIcon() -> String {
        switch self {
        case .home:
            return "house"
        case .favorites:
            return "heart"
        case .settings:
            return "gear"
        }
    }
}


class TabBarConfigurator {
    
    func configureTabs(with coordinator: Coordinator) -> [UINavigationController] {
        let pages: [TabBarPage] = [.home, .favorites, .settings]
            .sorted(by: { $0.pageOrderNumber() < $1.pageOrderNumber() })
        
        return pages.map { createNavigationController(for: $0, coordinator: coordinator) }
    }
    
    private func createNavigationController(for page: TabBarPage, coordinator: Coordinator) -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(false, animated: false)
        
        let pageIcon = UIImage(systemName: page.pageTabIcon())?.withRenderingMode(.alwaysOriginal).withConfiguration(UIImage.SymbolConfiguration(scale: .medium))
        navController.tabBarItem = UITabBarItem(
            title: page.pageTitleValue(),
            image: pageIcon?.withTintColor(.gray),
            selectedImage: pageIcon?.withTintColor(.blue)
        )
        
        // Defines Coordinators for pages on tab
        switch page {
        case .home:
            let homeCoordinator = HomeCoordinator(navigationController: navController)
            coordinator.childCoordinators.append(homeCoordinator)
            homeCoordinator.start()
        case .favorites:
            let favoritesCoordinator = FavoriteCoordinator(navigationController: navController)
            coordinator.childCoordinators.append(favoritesCoordinator)
            favoritesCoordinator.start()
        case .settings:
            let settingsCoordinator = SettingsCoordinator(navigationController: navController)
            coordinator.childCoordinators.append(settingsCoordinator)
            settingsCoordinator.finishDelegate = coordinator.finishDelegate
            settingsCoordinator.start()
        }
        
        return navController
    }
}
