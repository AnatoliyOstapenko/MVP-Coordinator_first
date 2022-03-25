//
//  ViewController.swift
//  MVP+Coordinator_first
//
//  Created by AnatoliiOstapenko on 25.03.2022.
//

import UIKit

class NewsViewController: UIViewController {
    
    weak var coordinator: MainCoordinator? // init MainCoordinator
    var newsTableView = UITableView()


    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableViewConfigure()

    }
    
    func newsTableViewConfigure() {
        view.addSubview(newsTableView)
        newsTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "newsCell")
        newsTableView.frame = view.bounds
        newsTableView.dataSource = self
        newsTableView.delegate = self
    }


}
// MARK: - TableView DataSource
extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        
        return cell
    }
    
    
}
// MARK: - TableView Delegate
extension NewsViewController: UITableViewDelegate {
    
}

