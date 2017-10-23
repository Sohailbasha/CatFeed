//
//  NetworkController.swift
//  Newsly
//
//  Created by Ilias Basha on 10/19/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import Foundation
import UIKit

class NetworkController {
    
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case patch = "PATCH"
        case delete = "DELETE"
    }
    
    static func performRequest(for url: URL,
                               httpMethod: HTTPMethod,
                               urlParameters: [String : String]? = nil,
                               body: Data? = nil,
                               completion: ((Data?, Error?) -> Void)? = nil) {
        
        let requestURL = self.url(bbyAdding: urlParameters, to: url)
        var request = URLRequest(url: requestURL)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = body
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            completion?(data, error)
        }
        dataTask.resume()
    }
    
    static func url(bbyAdding parameters: [String : String]?, to url: URL) -> URL {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = parameters?.flatMap({URLQueryItem(name: $0.0, value: $0.1)})
        
        guard let url = components?.url else {
            fatalError("URL optional is nil")
        }
        return url
    }
    
    
    private static let cache: NSCache<NSString, UIImage> = NSCache()
    
    static func imageForURL(string: String, completion: @escaping (UIImage?) -> ()){
        
        if let imageFromCache = cache.object(forKey: NSString(string: string)){
            completion(imageFromCache)
        } else {
            guard let url = URL(string: string),
                let imageData = (try? Data.init(contentsOf: url)),
                let imageFromData = UIImage(data: imageData)
                else { completion(nil); return }
            
            cache.setObject(imageFromData, forKey: NSString(string: string))
            completion(imageFromData)
        }
    }
    
    
    
}
















