//
//  ViewController.swift
//  MVP+Coordinator_first
//
//  Created by AnatoliiOstapenko on 25.03.2022.
//

import UIKit

class NewsViewController: UIViewController {
    
    lazy var presenter = NewsPresenter(view: self, networkService: NetworkService())
    weak var coordinator: MainCoordinator? // init MainCoordinator
    var array: [Articles] = []
    var newsTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableViewConfigure()
        presenter.getNews()
        
    }
    
    func newsTableViewConfigure() {
        view.addSubview(newsTableView)
        title = "NEWS"
        newsTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "newsCell")
        newsTableView.frame = view.bounds
        newsTableView.dataSource = self
        newsTableView.delegate = self
    }
    
    
}

// MARK: - TableView DataSource
extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        cell.updateUI(view: array[indexPath.row])
        return cell
    }
}

// MARK: - TableView Delegate
extension NewsViewController: UITableViewDelegate {
    
}
// MARK: - Presenter Delegate
extension NewsViewController: NewsPresenterView {
    func setData(news: [Articles]) {
        array = news
        DispatchQueue.main.async {
            self.newsTableView.reloadData()
        }
    }
}


