//
//  Book.swift
//  Bookcart
//
//  Created by ChangKeun Ji on 11/6/24.
//

import Foundation

// Top-level structure to match the entire JSON response
struct SearchResult: Codable {
    let meta: Meta
    let documents: [Book]
}

// Structure for the "meta" part of the response
struct Meta: Codable {
    let isEnd: Bool?
    let pageableCount: Int?
    let totalCount: Int?

    enum CodingKeys: String, CodingKey {
        case isEnd = "is_end"
        case pageableCount = "pageable_count"
        case totalCount = "total_count"
    }
}

// Structure for each book in "documents"
struct Book: Codable {
    let authors: [String]
    let contents: String
    let datetime: String
    let isbn: String
    let price: Int
    let publisher: String
    let salePrice: Int?
    let status: String
    let thumbnail: String
    let title: String
    let translators: [String]
    let url: String

    enum CodingKeys: String, CodingKey {
        case authors
        case contents
        case datetime
        case isbn
        case price
        case publisher
        case salePrice = "sale_price"
        case status
        case thumbnail
        case title
        case translators
        case url
    }
}

