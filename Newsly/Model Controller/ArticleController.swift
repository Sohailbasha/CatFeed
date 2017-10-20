//
//  ArticleController.swift
//  Newsly
//
//  Created by Ilias Basha on 10/19/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import Foundation

class ArticleController {

    
    static let shared = ArticleController()
    
    private let apiKey = "1fb14fda4d59496c8d0678093e9dbc02"
    let baseURL = URL(string: "http://beta.newsapi.org/v2/top-headlines")
    private let language = "en"
    
    
    
    func fetchArticlesFor(category: Category, completion: @escaping ([Article]?) -> Void?) {
        guard let url = baseURL else { return }
        let urlParameters = ["apiKey":apiKey, "language":language, "category":category.rawValue]
        
        NetworkController.performRequest(for: url,
                                         httpMethod: .get,
                                         urlParameters: urlParameters,
                                         body: nil) { (data, error) in
                                            
                                            
                                            guard let data = data,
                                                let responseString = String(data: data, encoding: .utf8) else {
                                                    print("No data returned from request")
                                                    completion([])
                                                    return
                                            }
                                            
                                            guard let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String:Any],
                                                let articleDicitonary = jsonDictionary["articles"] as? [[String:Any]] else {
                                                    print("unable to serialize json. \nresponse: \(responseString)")
                                                    return
                                            }
                                            
                                            let articles = articleDicitonary.flatMap {Article(dictionary:$0)}
                                            completion(articles)
        }
    }
}
