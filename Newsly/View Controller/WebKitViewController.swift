//
//  WebKitViewController.swift
//  Newsly
//
//  Created by Ilias Basha on 10/23/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit
import WebKit

class WebKitViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func loadWebView(url: String) {
        let configuration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: configuration)
        webView.uiDelegate = self
        view = webView
        
        if let url = URL(string: url), isViewLoaded {
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
        }
    }
    
}
