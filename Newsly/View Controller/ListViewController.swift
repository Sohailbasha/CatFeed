//
//  ListViewController.swift
//  Newsly
//
//  Created by Ilias Basha on 10/20/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit
import SafariServices


protocol ArticleDisplayList {
    var articles: [Article] { get set }
    var offset: Int { get set }
    var batchSize: Int { get }
    
}

class ListViewController: UIViewController, ArticleDisplayList, UIViewControllerTransitioningDelegate {
    
    // Mark: - Properties
    
    var categoryID: String?
    
    var articles: [Article] = []
    
    var offset: Int = 0
    var batchSize: Int = 6
    var numberOfArticlesPerScreenLimit = 1000
    
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.prefetchDataSource = self
    }
    
    
    
    // Functions
    
    func setupDetailView(with id: Sources) {
        ArticleController.shared.fetchArticlesFor(category: id) { (articles) -> Void in
            if let fetchedArticles = articles {
                self.articles = fetchedArticles
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func showWebsite(for url: URL) {
        let configuration = SFSafariViewController.Configuration()
        configuration.entersReaderIfAvailable = true
        let safariViewController = SFSafariViewController(url: url, configuration: configuration)
        safariViewController.preferredBarTintColor = .black
        safariViewController.preferredControlTintColor = .white
        safariViewController.dismissButtonStyle = .close
        safariViewController.transitioningDelegate = self
        self.present(safariViewController, animated: true, completion: nil)
    }
    
}

extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleCell", for: indexPath) as? ArticleCollectionViewCell
        let article = articles[indexPath.row]
        
        cell?.articleImageView.downloadedFrom(link: article.imageURL)
//        cell?.displayCellWith(article: articles[indexPath.row])
        cell?.titleLabel.text = article.title
        cell?.sourceLabel.text = article.source
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let url = URL(string: articles[indexPath.row].toURL) {
            self.showWebsite(for: url)
        }
    }
    
}

extension ListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.bounds.width - 70, height: 460)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(20, 10, 20, 10)
    }
    
}

extension ListViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
//        for indexPath in indexPaths {
//            let cell = collectionView.cellForItem(at: indexPath) as? ArticleCollectionViewCell
//            cell?.articleImageView.downloadedFrom(link: articles[indexPath.row].imageURL)
//            cell?.displayCellWith(article: articles[indexPath.row])
//        }
    }
}

extension ListViewController {
    
}






