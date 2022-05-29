//
//  Articles.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/29/22.
//

import Foundation
// MARK: - Article
struct Article: Codable {
    let content: String?
    let urlToImage: String?
    let source: Source
    let articleDescription: String?
    let title: String
    let publishedAt: String
    let author: String?
    let url: String

    enum CodingKeys: String, CodingKey {
        case content, urlToImage, source
        case articleDescription = "description"
        case title, publishedAt, author, url
    }
}
