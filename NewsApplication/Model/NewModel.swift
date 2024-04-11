//
//  NewModel.swift
//  NewsApplication
//
//  Created by R92 on 09/04/24.
//

import Foundation
// MARK: - Newsmodel
struct Newsmodel: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article1]?
}

// MARK: - Article
struct Article1: Codable {
    let source1: Source1?
    let author, title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - Source
struct Source1: Codable {
    let id: String?
    let name: String?
}
