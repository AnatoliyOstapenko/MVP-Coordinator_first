//
//  NetworkService.swift
//  MVP+Coordinator_first
//
//  Created by AnatoliiOstapenko on 25.03.2022.
//

import Foundation
import UIKit

protocol NetworkServiceProtocol {
    func getData(completion: @escaping(Result <NewsModel, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    func getData(completion: @escaping (Result <NewsModel, Error>) -> Void) {
        guard let url = URL(string: "\(Constants.urlString)\(Password.keyAPI)") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard error == nil, let data = data else { return }
                do {
                    let decodedData = try JSONDecoder().decode(NewsModel.self, from: data)
                    completion(.success(decodedData))
                } catch { completion(.failure(error))}
        }
        task.resume()
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
}

