//
//  NewsModel.swift
//  MVP+Coordinator_first
//
//  Created by AnatoliiOstapenko on 25.03.2022.
//

import Foundation

struct NewsModel: Codable {
    
    let articles: [Articles]
}

struct Articles: Codable {
    
    let source: Name?
    let description: String
    let publishedAt: String
    let title: String
    let url: String
    let urlToImage: String? // it should be optional in case not available image on site
    
}
struct Name: Codable {
    let publisher: String
    
    enum CodingKeys: String, CodingKey {
        case publisher = "name"
    }
}

