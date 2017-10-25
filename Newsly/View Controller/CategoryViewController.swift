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
        let color = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = color
        
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        
      
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









