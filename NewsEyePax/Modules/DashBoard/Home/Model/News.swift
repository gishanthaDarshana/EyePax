//
//  News.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/29/22.
//

import Foundation
struct News: Codable {
    let totalResults: Int
    let articles: [Article]
    let status: String
}
