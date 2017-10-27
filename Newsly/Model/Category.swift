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

    let art: UIImage
    let sourceFeed: Sources
    
    init(sourceFeed: Sources, art: UIImage) {
        self.sourceFeed = sourceFeed
        self.art = art
    }
}



enum Sources: String {
    case tech = "the-next-web,the-verge,engadget,crypto-coins-news,wired"
    case gaming = "ign,polygon"
    case business = "the-wall-street-journal,fortune,business-insider,financial-post"
    case science = "national-geographic,new-scientist"
    case sports = "bbc-sport,bleacher-report,talksport,espn"
    case popCulture = "the-lad-bible,buzzfeed,mashable,reddit-r-all"
    case international = "al-jazeera-english,news24,the-times-of-india,rte"
    case reputedSources = "time,the-washington-post,the-new-york-times,reuters"
}
