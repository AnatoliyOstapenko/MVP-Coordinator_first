//
//  NewsPresenter.swift
//  MVP+Coordinator_first
//
//  Created by AnatoliiOstapenko on 25.03.2022.
//

import Foundation
import UIKit

protocol NewsPresenterView: AnyObject {
    func setData(news: [Articles])
    func setImage(image: UIImage?)
}

class NewsPresenter {

    weak var view: NewsPresenterView?
    private let networkService: NetworkService
 
    init(view: NewsPresenterView, networkService: NetworkService) {
        self.view = view
        self.networkService = networkService
    }
    
    func getNews() {
        self.networkService.getData { [weak self] results in
            switch results {
            case .success(let data):
                self?.view?.setData(news: data.articles)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getImage(urlString: String?) {
        self.networkService.getImage(urlString: urlString) { [weak self] data in
            switch data {
            case .success(let image):
                self?.view?.setImage(image: image)
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
}


