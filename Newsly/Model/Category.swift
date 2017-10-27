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

enum Sources: String {
    case tech = "the-next-web,the-verge,engadget,crypto-coins-news,hacker-news,wired"
    case gaming = "ign,polygon"
    case business = "the-wall-street-journal,fortune,business-insider,financial-post"
    case science = "national-geographic,new-scientist"
    case sports = "bbc-sport,bleacher-report,talksport,espn"
    case popCulture = "the-lad-bible,buzzfeed,mashable,reddit-r-all"
    case international = "al-jazeera-english,news24,the-times-of-india,rte"
    case reputedSources = "time,the-washington-post,the-new-york-times,reuters"
}
