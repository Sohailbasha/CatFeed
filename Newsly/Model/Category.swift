//
//  CategoryCard.swift
//  Newsly
//
//  Created by Ilias Basha on 10/19/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import Foundation
import UIKit

class Category {
    let category: CategoryType
    let art: UIImage
    
    init(category: CategoryType, art: UIImage) {
        self.category = category
        self.art = art
    }
}

enum CategoryType: String {

    case technology = "technology"
    case gaming = "gaming"
    case entertainment = "entertainment"
    case business = "business"
    case science = "science-and-nature"
    case sports = "sport"
    
}
