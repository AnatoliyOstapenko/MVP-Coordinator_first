//
//  NewsTableViewCell.swift
//  MVP+Coordinator_first
//
//  Created by AnatoliiOstapenko on 25.03.2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    lazy var presenter = NewsPresenter(image: self, networkService: NetworkService())
    var newsImageView = UIImageView()
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    var spinner = UIActivityIndicatorView()
    var imageCell: UIImage?
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateNews(view: Articles) {
        presenter.getImage(urlString: view.urlToImage)
        titleLabel.text = view.title
        descriptionLabel.text = view.description
        newsImageView.image = imageCell
    }
    
    func updateSecondVC(view: SecondModel) {
        titleLabel.text = view.title
        descriptionLabel.text = view.description
        newsImageView.image = UIImage(systemName: view.image)
        newsImageView.tintColor = .systemPink
        newsImageView.contentMode = .scaleAspectFit
    }

    func setCell() {
        setNewsImageView()
        setTitleLabel()
        setDescriptionLabel()
    }

    func setNewsImageView() {
        addSubview(newsImageView)
        newsImageView.clipsToBounds = true
        newsImageView.layer.cornerRadius = 8
        newsImageView.image = UIImage(named: "images")
        newsImageView.contentMode = .scaleAspectFill
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        newsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        newsImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        newsImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        newsImageView.widthAnchor.constraint(equalTo: newsImageView.heightAnchor, multiplier: 3/2).isActive = true
    }
    
    func setTitleLabel() {
        addSubview(titleLabel)
        titleLabel.text = "TITLE"
        titleLabel.font = .boldSystemFont(ofSize: 14)
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 5).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        // this is important to avoid unexpected alignment text by height:
        titleLabel.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)
    }
    
    func setDescriptionLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.text = "Description............"
        descriptionLabel.textAlignment = .left
        descriptionLabel.font = .systemFont(ofSize: 12, weight: .thin)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 5).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
    }
}
//MARK: - NewsPresenterImage
extension NewsTableViewCell: NewsPresenterImage {
    func setImage(image: UIImage?) {
            self.imageCell = image
    }
}
