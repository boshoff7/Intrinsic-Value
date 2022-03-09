//
//  ArticleModel.swift
//  Intrinsic Value
//
//  Created by Chris Boshoff on 2022/03/09.
//

import Foundation

protocol ArticleModelProtocol {
    
    func articlesRetrieved(_ articles:[Atricle])
}

class ArticleModel {
    
    var delegate: ArticleModelProtocol?
    
    func getArticles() {
        
//        // Send of API request
//        // Create URL
//        let UrlString = "www.google.com"
//        
//        // Create URL object
//        let url = URL(string: UrlString)
//        
//        // Check if it is nil
//        guard url != nil else {
//            print("Could not find url")
//            return
//        }
//        
//        // Create URL Session
//        let session = URLSession.shared
//        
//        // Create Data Task
//        let dataTask = session.dataTask(with: url!) { data, response, error in
//            
//            if error == nil && data != nil {
//                let decoder = JSONDecoder()
//                
//                do  {
//                    let articleService = decoder.decode(AtricleService.self, from: data!)
//                }
//            }
//        }
        
        // Start Data Task
        
        // Parse the returned JSON into article instances and pass it back to the view controller with the protocol and delegate patterns
        delegate?.articlesRetrieved([Atricle]())
        
    }
    
}
