//
//  MainCoordinator.swift
//  MVP+Coordinator_first
//
//  Created by AnatoliiOstapenko on 25.03.2022.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinator: [Coordinator]? = []
    
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    // create method which handles with initial VC
    func start() {
        let vc = NewsViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
        
    }
    
    
}
