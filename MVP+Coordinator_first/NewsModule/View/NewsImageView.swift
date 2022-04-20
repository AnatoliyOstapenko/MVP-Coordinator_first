//
//  NewsImageView.swift
//  MVP+Coordinator_first
//
//  Created by AnatoliiOstapenko on 20.04.2022.
//

import UIKit

class NewsImageView: UIImageView {
    let placeholderImage = UIImage(named: "noImage")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureNewsImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureNewsImage() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadNewsImage(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard error == nil, let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self?.image = image
            }
        }
        task.resume()
    }
    


}
