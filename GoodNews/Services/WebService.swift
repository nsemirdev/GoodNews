//
//  WebService.swift
//  GoodNews
//
//  Created by Emir Alkal on 15.01.2023.
//

import Foundation

final class WebService {
    
    private init() {}
    static let shared = WebService()
    
    enum Endpoints {
        static var topHeadlines: URL? {
            URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=f7df408d8c4c4186839834342246611e")
        }
    }
    
    func getArticles(url: URL?, completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let url else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                completion(.failure(error!))
            }
            
            guard let data else { return }
            
            do {
                let topHeadlines = try JSONDecoder().decode(TopHeadlines.self, from: data)
                completion(.success(topHeadlines.articles))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}
