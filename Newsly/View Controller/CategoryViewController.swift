//
//  CategoryViewController.swift
//  Newsly
//
//  Created by Ilias Basha on 10/19/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    @IBOutlet var collectionView: UICollectionView!
    
    func setupViews() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let bannerImageView = UIImageView(image: #imageLiteral(resourceName: "banner"))
        bannerImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = bannerImageView
        
        let widthConstraint = bannerImageView.widthAnchor.constraint(equalToConstant: view.frame.width)
        let heightConstraint = bannerImageView.heightAnchor.constraint(equalToConstant: 70)
        widthConstraint.isActive = true
        heightConstraint.isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CategoryController.shared.categoryCards.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as? CategoryCollectionViewCell
        cell?.category = CategoryController.shared.categoryCards[indexPath.row]
        return cell ?? UICollectionViewCell()
    }
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showArticles" {
            if let destinationVC = segue.destination as? ListViewController {
                if let cell = sender as? CategoryCollectionViewCell {
                    if let indexPath = collectionView.indexPath(for: cell) {
                        let id = CategoryController.shared.categoryCards[indexPath.row].category
                        destinationVC.setupDetailView(with: id)
                    }
                }
            }
        }
    }
    

    

}









