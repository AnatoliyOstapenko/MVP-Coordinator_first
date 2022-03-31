//
//  NewsTableViewCell.swift
//  MVP+Coordinator_first
//
//  Created by AnatoliiOstapenko on 25.03.2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    var newsImageView = UIImageView()
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    var spinner = UIActivityIndicatorView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
        spinner.startAnimating()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI(view: Articles) {
        titleLabel.text = view.title
        descriptionLabel.text = view.description
        let dispatch = DispatchQueue.global(qos: .utility)
        dispatch.async {
            self.getingImages(string: view.urlToImage) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let image):
                        self?.newsImageView.image = image
                        self?.spinner.stopAnimating()
                    case .failure(let error):
                        self?.newsImageView.image = UIImage(named: "images")
                        print(error)
                    }
                }
                
            }
        }
        
    }
    
    func getingImages(string: String?, completion: @escaping(Result< UIImage, Error>) -> Void) {
        if let url = URL(string: string ?? "noImage") {
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                guard error == nil, let data = data else { return }
                guard let image = UIImage(data: data) else { return }
                completion(.success(image))
            }
            task.resume()
        }
    }
    
    
    
    
    func configureCell() {
        newsImageViewConfigure()
        titleLabelConfigure()
        descriptionLabelConfigure()
        spinnerConfigure()
    }
    func spinnerConfigure() {
        addSubview(spinner)
        spinner.style = .large
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.centerYAnchor.constraint(equalTo: newsImageView.centerYAnchor).isActive = true
        spinner.centerXAnchor.constraint(equalTo: newsImageView.centerXAnchor).isActive = true
    }

    func newsImageViewConfigure() {
        addSubview(newsImageView)
        newsImageView.clipsToBounds = true
        newsImageView.contentMode = .scaleAspectFill
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        newsImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        newsImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        newsImageView.widthAnchor.constraint(equalTo: newsImageView.heightAnchor, multiplier: 3/2).isActive = true
    }
    
    func titleLabelConfigure() {
        addSubview(titleLabel)
        titleLabel.text = "title"
        titleLabel.textAlignment = .left
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    func descriptionLabelConfigure() {
        addSubview(descriptionLabel)
        descriptionLabel.text = "Description"
        descriptionLabel.textAlignment = .left
        descriptionLabel.font = .italicSystemFont(ofSize: 14)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    
}
