//
//  NewsPresenter.swift
//  MVP+Coordinator_first
//
//  Created by AnatoliiOstapenko on 25.03.2022.
//

import Foundation

protocol NewsPresenterView: AnyObject {
    func setData(news: [Articles?])
}

class NewsPresenter {

    weak var view: NewsPresenterView?
    private let networkService: NetworkService
    
    init(view: NewsPresenterView, networkService: NetworkService) {
        self.view = view
        self.networkService = networkService
    }
    
    func getNews() {
        networkService.getData { [weak self] results in
            switch results {
            case .success(let data):
                self?.view?.setData(news: data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}
