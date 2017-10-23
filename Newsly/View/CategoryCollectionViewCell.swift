//
//  CategoryCollectionViewCell.swift
//  Newsly
//
//  Created by Ilias Basha on 10/19/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    var category: Category? {
        didSet {
            setupView()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)

        setupSubViews()
    }
    
    @IBOutlet weak var categoryImageView: UIImageView!
    
    func setupView() {
        if let category = category {
            categoryImageView.image = category.art
        }
    }
    
    func setupSubViews() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 4.0)
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 0.25
        self.layer.masksToBounds = false
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}
