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
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.prefetchDataSource = self
    }
    
    // Functions
    
    func setupDetailView(with id: CategoryType) {
        ArticleController.shared.fetchArticlesFor(category: id) { (articles) -> Void in
            if let fetchedArticles = articles {
                self.articles = fetchedArticles
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    
    // Mark: - Properties
   
    var categoryID: String?
    var articles: [Article] = []
    
    
    @IBOutlet var collectionView: UICollectionView!
    
}

extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleCell", for: indexPath)
        print(articles[indexPath.row].title)
        return cell
    }
}



extension ListViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            print(indexPath)
        }
    }
}


extension UICollectionViewDataSource {
    
}












