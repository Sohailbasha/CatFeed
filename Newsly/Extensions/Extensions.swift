//
//  Extensions.swift
//  Newsly
//
//  Created by Ilias Basha on 10/23/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}


protocol CardViewDelegate { }
extension CardViewDelegate where Self: UIView {
    
    // Cards shadow
    func cardify() {
        self.layer.cornerRadius = 14
        let color = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.25
        self.layer.masksToBounds = false
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
}




