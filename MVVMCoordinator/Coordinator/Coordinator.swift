//
//  Coordinator.swift
//  MVVMCoordinator
//
//  Created by YoncaYeprem on 18.09.2024.
//

import Foundation
import UIKit

enum CoordinatorTypeEnum {
    case app
    case auth
    case tab
}

protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: Coordinator)
}

protocol Coordinator : AnyObject {
    var navigationController : UINavigationController { get set }
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    var childCoordinators : [ Coordinator ] { get set }
    var coordinatorType : CoordinatorTypeEnum { get }
    
    func start()
    func finish()
}

extension Coordinator {
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0.coordinatorType != coordinator.coordinatorType }
        navigationController.viewControllers.removeAll()
    }
    
    func finish(){
        childCoordinators.removeAll()
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}
