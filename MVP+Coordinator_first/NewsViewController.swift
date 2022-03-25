//
//  ViewController.swift
//  MVP+Coordinator_first
//
//  Created by AnatoliiOstapenko on 25.03.2022.
//

import UIKit

class NewsViewController: UIViewController {
    
    weak var coordinator: MainCoordinator? // init MainCoordinator


    override func viewDidLoad() {
        super.viewDidLoad()
        title = "NEWS"
        view.backgroundColor = .cyan
    }


}

