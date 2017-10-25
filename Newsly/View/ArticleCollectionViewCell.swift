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
    
    @IBOutlet var imageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var imageViewWidthConstraint: NSLayoutConstraint!
    

    override func prepareForReuse() {
        super.prepareForReuse()
        self.articleImageView.image = nil
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // add things that you see on the screen
        self.articleImageView.contentMode = .scaleAspectFit
        self.articleImageView.layer.cornerRadius = 14
        self.articleImageView.clipsToBounds = true
        setupImageSize()
    }
    
    
    func setupImageSize() {
        if let image = articleImageView.image {
//            let widthRatio = articleImageView.bounds.size.width / image.size.width
//            let heightRatio = articleImageView.bounds.size.height / image.size.height
            
            let widthRatio = self.bounds.size.width / image.size.width
            let heightRatio = self.bounds.size.height / image.size.height
            
            let scale = min(widthRatio, heightRatio)
            DispatchQueue.main.async {
                self.imageViewHeightConstraint.constant = scale * image.size.height
                self.imageViewWidthConstraint.constant = scale * image.size.width
            }
        }
    }
    
    
    
    
    @IBOutlet var articleImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    
    private func displayCellWith(article: Article?) {
        if let article = article {
            backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            self.titleLabel.text = article.title
            self.articleImageView.alpha = 1
            self.titleLabel.alpha = 1
        } else {
            backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            titleLabel.alpha = 0
            articleImageView.alpha = 0
        }
    }
}










