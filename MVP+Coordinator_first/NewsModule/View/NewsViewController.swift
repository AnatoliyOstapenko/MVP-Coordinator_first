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
    var image: UIImage?
    var newsTableView = UITableView()
    var spinner = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableViewConfigure()
        spinnerConfigure()
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
    
    func spinnerConfigure() {
        view.addSubview(spinner)
        spinner.style = .large
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.centerYAnchor.constraint(equalTo: newsTableView.centerYAnchor).isActive = true
        spinner.centerXAnchor.constraint(equalTo: newsTableView.centerXAnchor).isActive = true
    }
}

// MARK: - TableView DataSource
extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        cell.titleLabel.text = array[indexPath.row].title
        cell.descriptionLabel.text = array[indexPath.row].description
        
        if let url = URL(string: self.array[indexPath.row].urlToImage ?? "https://www.apple.com") {
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                guard error == nil, let data = data else { return }
                guard let image = UIImage(data: data) else { return }
                DispatchQueue.main.async {
                    cell.newsImageView.image = image
                }
            }
            task.resume()
        }
        
        
        
        
        
        
        
        //       presenter.getImage(urlString: self.array[indexPath.row].urlToImage)
        //       cell.newsImageView.image = self.image
        
        
        
        
        
        return cell
    }
}

// MARK: - TableView Delegate
extension NewsViewController: UITableViewDelegate {
    
}
// MARK: - Presenter Delegate
extension NewsViewController: NewsPresenterView {
    func setImage(image: UIImage?) {
        
        //            guard let image = image else { return }
        //            self.image = image
        //            DispatchQueue.main.async {
        //                self.newsTableView.reloadData()
        //
        //            }
        
        
    }
    func setData(news: [Articles]) {
        array = news
        DispatchQueue.main.async {
            self.newsTableView.reloadData()
        }
    }
}


