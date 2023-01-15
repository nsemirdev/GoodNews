//
//  TopHeadlinesResponse.swift
//  GoodNews
//
//  Created by Emir Alkal on 15.01.2023.
//

import Foundation

struct TopHeadlines: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
