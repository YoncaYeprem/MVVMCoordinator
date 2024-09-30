//
//  TabController.swift
//  MVVMCoordinator
//
//  Created by YoncaYeprem on 18.09.2024.
//

import Foundation
import UIKit

class TabCoordinator: NSObject, Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var finishDelegate: CoordinatorFinishDelegate?
    var coordinatorType: CoordinatorTypeEnum = .tab
    var tabBarController: UITabBarController
    private var tabBarConfigurator: TabBarConfigurator
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = UITabBarController()
        self.tabBarConfigurator = TabBarConfigurator()
    }
    
    func start() {
        setupTabBar()
    }
    
    private func setupTabBar() {
        let viewControllers = tabBarConfigurator.configureTabs(with: self)  // Tabların oluşturulması
        
        tabBarController.viewControllers = viewControllers  // Tab bar controller'a eklenmesi
        tabBarController.delegate = self
        tabBarController.selectedIndex = TabBarPage.home.pageOrderNumber()
        
        navigationController.viewControllers = [tabBarController]
    }
    
    deinit {
        print("TabCoordinator deinit")
    }
    
    func finish(){
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

extension TabCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // Tab bar seçimi değiştiğinde yapılacak işlemler
    }
}
