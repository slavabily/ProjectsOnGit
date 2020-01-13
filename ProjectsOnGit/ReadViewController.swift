//
//  ReadViewController.swift
//  ProjectsOnGit
//
//  Created by slava bily on 13/1/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import UIKit
import WebKit

class ReadViewController: UIViewController, WKNavigationDelegate {
    
    var webView = WKWebView()
    var project: Project!
    
    let allowedSites = ["github.com"]
    
    override func loadView() {
        webView.navigationDelegate = self
               
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        assert(project != nil, "You must set a project before show this view controller.")
        title = project.title
        
        guard let url = URL(string: "https://github.com/slavabily/\(project.title)") else {
            return
        }
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let host = navigationAction.request.url?.host {
            if allowedSites.contains(where: host.contains) {
                decisionHandler(.allow)
                return
            } else {
                print("Disallowed invalid site \(host).")
            }
        }
    }
    

   
}
