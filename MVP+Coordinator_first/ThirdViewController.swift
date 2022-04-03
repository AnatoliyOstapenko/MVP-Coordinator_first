//
//  ThirdViewController.swift
//  MVP+Coordinator_first
//
//  Created by AnatoliiOstapenko on 03.04.2022.
//

import UIKit

class ThirdViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    var thirdTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setThirdTableView()
        
    }
    
    func setThirdTableView() {
        title = "Write your news"
        thirdTableView = UITableView(frame: .zero, style: .grouped) //grouped descign
        thirdTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.thirdCell)
        view.addSubview(thirdTableView)
        thirdTableView.dataSource = self
        thirdTableView.frame = view.bounds
    }

}
// MARK: - DataSource
extension ThirdViewController: UITableViewDataSource {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.thirdCell, for: indexPath)
        
        cell.textLabel?.text = "Hello"
        return cell
    }
    
    
}
