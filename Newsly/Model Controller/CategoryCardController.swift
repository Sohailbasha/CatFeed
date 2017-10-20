//
//  CategoryCardController.swift
//  Newsly
//
//  Created by Ilias Basha on 10/19/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import Foundation

class CategoryCardController {
    
    static let shared = CategoryCardController()
    
    var categoryCards: [CategoryCard] = []

    init() {
        let categoryEntertainment = CategoryCard(category: .general, art: #imageLiteral(resourceName: "entertainment"))
        categoryCards = [categoryEntertainment]
    }
    
    
}
