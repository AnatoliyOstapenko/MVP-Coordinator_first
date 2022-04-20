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
        setNewsTableView()
        presenter.getNews()
        rightBarButtonConfigure()
        
    }
    
    func rightBarButtonConfigure() {
        let rightBarButton = UIBarButtonItem(title: "next screen", style: .plain, target: self, action: #selector(rightBarButtonPressed(sender:)))
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func rightBarButtonPressed(sender: Any?) {
        coordinator?.goToSecondVC()
    }
    
    func setNewsTableView() {
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
        cell.updateNews(view: self.array[indexPath.row])
        return cell
    }
}

// MARK: - TableView Delegate
extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
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


