//
//  CategoryCard.swift
//  Newsly
//
//  Created by Ilias Basha on 10/19/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import Foundation
import UIKit

class CategoryCard {
    let category: Category
    let art: UIImage
    
    init(category: Category, art: UIImage) {
        self.category = category
        self.art = art
    }
}

enum Category: String {
    case general = "general"
    case technology = "technology"
    case gaming = "gaming"
    case politics = "politics"
    case business = "business"
    case science = "science-and-nature"
    case sports = "sport"
}
