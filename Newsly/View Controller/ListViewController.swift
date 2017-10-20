//
//  ListViewController.swift
//  Newsly
//
//  Created by Ilias Basha on 10/20/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // Functions
    
    func setupDetailView(with id: CategoryType) {
        ArticleController.shared.fetchArticlesFor(category: id) { (articles) -> Void in
            if let fetchedArticles = articles {
                self.articles = fetchedArticles
            }
            DispatchQueue.main.async {
//                self.collectionView.reloadData()
            }
        }
    }
    
    

    // MARK: - Outlets
    
    // Mark: - Properties
    
    @IBOutlet var collectionView: UICollectionView!
    var categoryID: String?
    var articles: [Article] = []
    
    

}
