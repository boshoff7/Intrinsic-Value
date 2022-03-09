//
//  ViewController.swift
//  Intrinsic Value
//
//  Created by Chris Boshoff on 2022/03/04.
//

import UIKit

class NewsViewController: UIViewController {
    
    var model = ArticleModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        model.delegate = self
        model.getArticles()
        
    }

}

// MARK: - Atricle Model Protocol Methods

extension NewsViewController: ArticleModelProtocol {
    
    func articlesRetrieved(_ articles: [Atricle]) {
        
    }
    
}

