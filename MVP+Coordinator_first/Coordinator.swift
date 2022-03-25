//
//  Coordinator.swift
//  MVP+Coordinator_first
//
//  Created by AnatoliiOstapenko on 25.03.2022.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinator: [Coordinator]? { get set }
    var navigationController: UINavigationController { get set }
    func start()
    
}
