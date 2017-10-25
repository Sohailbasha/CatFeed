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

        let cardEntertainment = Category(category: .entertainment, art: #imageLiteral(resourceName: "entertainment"))
        let cardBusiness = Category(category: .business, art: #imageLiteral(resourceName: "business"))
        let cardTechnology = Category(category: .technology, art: #imageLiteral(resourceName: "tech"))
        let cardGaming = Category(category: .gaming, art: #imageLiteral(resourceName: "gaming"))
        let cardScience = Category(category: .science, art: #imageLiteral(resourceName: "science"))
        let cardSports = Category(category: .sports, art: #imageLiteral(resourceName: "sports"))
        
        categoryCards = [cardEntertainment, cardBusiness, cardTechnology, cardGaming, cardScience, cardSports]
    }
    
    
}
