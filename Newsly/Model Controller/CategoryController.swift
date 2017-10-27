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

        let cardEntertainment = Category(sourceFeed: .popCulture, art: #imageLiteral(resourceName: "entertainment"))
        let cardBusiness = Category(sourceFeed: .business, art: #imageLiteral(resourceName: "business"))
        let cardTechnology = Category(sourceFeed: .tech, art: #imageLiteral(resourceName: "tech"))
        let cardGaming = Category(sourceFeed: .gaming, art: #imageLiteral(resourceName: "gaming"))
        let cardScience = Category(sourceFeed: .science, art: #imageLiteral(resourceName: "science"))
        let cardSports = Category(sourceFeed: .sports, art: #imageLiteral(resourceName: "sports"))
        let cardInternational = Category(sourceFeed: .international, art: #imageLiteral(resourceName: "international"))
        let cardReputed = Category(sourceFeed: .reputedSources, art: #imageLiteral(resourceName: "reputed"))
        
        categoryCards = [cardReputed, cardTechnology, cardEntertainment, cardBusiness, cardInternational, cardGaming, cardScience, cardSports]
    }
    
    
}
