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
    func goToSecondVC() {
        let vc = SecondViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToThirdVC(viewController: UIViewController) {
        let vc = ThirdViewController()
        let navController = UINavigationController(rootViewController: vc) //add second navController
        viewController.present(navController, animated: true)
        
    }
    func goToEditVC(view: UIViewController) {
        let vc = EditViewController()
        let navController = UINavigationController(rootViewController: vc)
        view.present(navController, animated: true)
    }
    
    
}
