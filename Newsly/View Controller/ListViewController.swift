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
        footerView?.activityIndicator.startAnimating()
    }
    
    // Functions
    
    func setupDetailView(with id: CategoryType) {
        ArticleController.shared.fetchArticlesFor(category: id) { (articles) -> Void in
            if let fetchedArticles = articles {
                self.articles = fetchedArticles
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.footerView?.activityIndicator.stopAnimating()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toWebView" {
            if let cell = sender as? ArticleCollectionViewCell {
                if let indexPath = collectionView.indexPath(for: cell) {
                    if let destinationVC = segue.destination as? WebKitViewController {
                        let articleURL = articles[indexPath.row].toURL
                        DispatchQueue.main.async {
                            destinationVC.loadWebView(url: articleURL)
                        }
                    }
                }
            }
        }
    }
    
    
    // Mark: - Properties
    
    var categoryID: String?
    
    var articles: [Article] = []
    
    var offset: Int = 0
    var batchSize: Int = 6
    var numberOfArticlesPerScreenLimit = 1000
    
 
    var footerView: LoadingFooterView?
    
    @IBOutlet var collectionView: UICollectionView!
    
}

extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleCell", for: indexPath) as? ArticleCollectionViewCell
        let article = articles[indexPath.row]

        cell?.articleImageView.downloadedFrom(link: article.imageURL)
        cell?.titleLabel.text = article.title
        cell?.sourceLabel.text = article.source
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: LoadingFooterView.reuseID, for: indexPath) as? LoadingFooterView
        footerView?.activityIndicator.startAnimating()
        footerView?.activityIndicator.hidesWhenStopped = true
        self.footerView = footerView
        return footerView ?? UICollectionReusableView()
    }
    
}

extension ListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            return CGSize(width: collectionView.bounds.width - 70, height: 460)
        } else {
            // TO DO iPAD
            return CGSize()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(20, 10, 20, 10)
    }
    
}

extension ListViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
//            let cell = collectionView.cellForItem(at: indexPath) as? ArticleCollectionViewCell
//            cell?.articleImageView.downloadedFrom(link: articles[indexPath.row].imageURL)
        }
    }
}









