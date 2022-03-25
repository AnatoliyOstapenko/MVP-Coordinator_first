//
//  NetworkService.swift
//  MVP+Coordinator_first
//
//  Created by AnatoliiOstapenko on 25.03.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func getData(completion: @escaping(Result <[Articles?], Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func getData(completion: @escaping (Result<[Articles?], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.urlString)\(Password.keyAPI)") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard error == nil, let data = data else { return }
                do {
                    let decodedData = try JSONDecoder().decode([Articles].self, from: data)
                    completion(.success(decodedData))
                } catch { completion(.failure(error))}
        }
        task.resume()
    }
}
