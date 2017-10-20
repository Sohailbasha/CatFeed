//
//  CategoryCardController.swift
//  Newsly
//
//  Created by Ilias Basha on 10/19/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import Foundation

class CategoryController {
    
    static let shared = CategoryController()
    
    var categoryCards: [Category] = []

    init() {
        let cardEverything = Category(category: .general, art: #imageLiteral(resourceName: "everything"))
        let cardBusiness = Category(category: .business, art: #imageLiteral(resourceName: "business"))
        let cardPolitics = Category(category: .politics, art: #imageLiteral(resourceName: "politics"))
        let cardNerdStuff = Category(category: .technology, art: #imageLiteral(resourceName: "tech"))
        categoryCards = [cardEverything, cardBusiness, cardPolitics, cardNerdStuff]
    }
    
    
}
