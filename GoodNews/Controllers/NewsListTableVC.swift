//
//  NewsListTableVC.swift
//  GoodNews
//
//  Created by Emir Alkal on 15.01.2023.
//

import UIKit

final class NewsListTableVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRequest()
    }
    
    fileprivate func fetchRequest() {
        WebService.shared.getArticles(url: WebService.Endpoints.topHeadlines) { result in
            switch result {
            case .success(let articles):
                print(articles)
            case .failure(let error):
                print(error)
            }
        }
    }
}
