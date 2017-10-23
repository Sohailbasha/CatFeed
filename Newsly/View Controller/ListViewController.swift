//
//  ListViewController.swift
//  Newsly
//
//  Created by Ilias Basha on 10/20/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit

class LoadingFooterView: UICollectionReusableView {
    static let reuseID = "LoadingFooterView"
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
}


protocol ArticleDisplayList {
    var articles: [Article] { get set }
    var offset: Int { get set }
    var batchSize: Int { get }
    
}

class ListViewController: UIViewController, ArticleDisplayList {

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
    
    func fetchImagesFrom(articles: [Article]) -> [UIImage] {
        var images: [UIImage] = []
        for article in articles {
            NetworkController.imageForURL(string: article.imageURL, completion: { (image) in
                if let image = image {
                    images.append(image)
                }
            })
        }
        return images
    }
    
    
    // Mark: - Properties
   
    var categoryID: String?
    
    var articles: [Article] = []
    var offset: Int = 0
    var batchSize: Int = 12
    var numberOfArticlesPerScreenLimit = 1000
    
    //
    var images: [UIImage] = []
    //
    
    var footerView: LoadingFooterView?
    
    @IBOutlet var collectionView: UICollectionView!
    
}

extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleCell", for: indexPath) as? ArticleCollectionViewCell
        var article = articles[indexPath.row]
        cell?.titleLabel.text = article.title
        
        cell?.articleImageView.image = article.photo
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: LoadingFooterView.reuseID, for: indexPath) as? LoadingFooterView
        footerView?.activityIndicator.startAnimating()
        footerView?.activityIndicator.hidesWhenStopped = true
        self.footerView = footerView
        return footerView ?? UICollectionReusableView()
    }
    
   /*
     func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let numberOfArticles = articles.count
        guard let activityIndicatorFooter = self.footerView else {
            return
        }
        
        if activityIndicatorFooter.activityIndicator.isAnimating {
            return
        }
        
        if (indexPath.row == numberOfArticles - 1 && numberOfArticles >= batchSize && indexPath.row < numberOfArticlesPerScreenLimit) {
            
        }
    }
     */
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











