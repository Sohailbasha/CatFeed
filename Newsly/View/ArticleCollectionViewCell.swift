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

    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.articleImageView.image = nil
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // add things that you see on the screen
        self.articleImageView.contentMode = .scaleAspectFill
        self.articleImageView.layer.cornerRadius = 15
        self.articleImageView.clipsToBounds = true
        
    }
    

    
    @IBOutlet var articleImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var sourceLabel: UILabel!
    
    private var longPressGestureRecognizer: UILongPressGestureRecognizer? = nil
    
    private var isPressed: Bool = false

    let shadowView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 10.0)
        view.layer.masksToBounds = false
        view.layer.rasterizationScale = UIScreen.main.scale
        return view
    }()
    
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
    
    
    private func configureGestureRecognizer() {
        longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture(gestureRecognizer:)))
        longPressGestureRecognizer?.minimumPressDuration = 0.1
        addGestureRecognizer(longPressGestureRecognizer!)
    }
    
    @objc internal func handleLongPressGesture(gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began {
            handleLongPressBegan()
        } else if gestureRecognizer.state == .ended || gestureRecognizer.state == .cancelled {
            handleLongPressEnded()
        }
    }
    
    private func handleLongPressBegan() {
        guard !isPressed else {
            return
        }
        isPressed = true
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0.8,
                       options: .beginFromCurrentState,
                       animations: {
                        self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }, completion: nil)
    }
    
    private func handleLongPressEnded() {
        guard isPressed else {
            return
        }
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0.8,
                       options: .beginFromCurrentState,
                       animations: {
            self.transform = CGAffineTransform.identity
        }) { (_) in
            self.isPressed = false
        }
    }
}










