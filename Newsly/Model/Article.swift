//
//  Article.swift
//  Newsly
//
//  Created by Ilias Basha on 10/19/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import Foundation
import UIKit

struct Article {
    
    private let sourceNameKey = "name"
    private let titleKey = "title"
    private let imageURLKey = "urlToImage"
    private let toURLKey = "url"
    
    let title: String
    let imageURL: String
    let toURL: String
    let source: String
    
    init?(dictionary: [String:Any]) {
        guard let title = dictionary[titleKey] as? String,
            let imageURL = dictionary[imageURLKey] as? String,
            let toURL = dictionary[toURLKey] as? String else { return nil }
        
        guard let sourceDictionary = dictionary["source"] as? [String:Any],
            let source = sourceDictionary[sourceNameKey] as? String else { return nil }
        
        self.title = title
        self.imageURL = imageURL
        self.toURL = toURL
        self.source = source
    }
    

}

