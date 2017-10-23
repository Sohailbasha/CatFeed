//
//  WebKitViewController.swift
//  Newsly
//
//  Created by Ilias Basha on 10/23/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit
import WebKit

class WebKitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
    }
    
    func loadWebView(url: String) {
        if let url = URL(string: url) {
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
        }
    }

    
    @IBOutlet var webView: WKWebView!
    
}
