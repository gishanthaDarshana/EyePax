//
//  HeadLines.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/29/22.
//

import Foundation


// MARK: - HeadLines
struct HeadLines: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}



