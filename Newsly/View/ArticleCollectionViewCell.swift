//
//  ArticleCollectionViewCell.swift
//  Newsly
//
//  Created by Ilias Basha on 10/23/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit
import CoreMotion

class ArticleCollectionViewCell: UICollectionViewCell {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = 14
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.articleImageView.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    private let motionManager = CMMotionManager()
    
    
    @IBOutlet var articleImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    
    private func displayCellWith(article: Article?) {
        if let article = article {
            backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            self.titleLabel.text = article.title
            
            self.articleImageView.alpha = 1
            self.titleLabel.alpha = 1
            
            
        } else {
            backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
            titleLabel.alpha = 0
            articleImageView.alpha = 0
        }
    }
    
}

extension ArticleCollectionViewCell: CardViewDelegate {}









