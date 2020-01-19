//
//  NavigationDelegate.swift
//  ProjectsOnGit
//
//  Created by slava bily on 14/1/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import UIKit
import WebKit

class NavigationDelegate: NSObject, WKNavigationDelegate {
    
    let allowedSites = ["github.com"]

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if isAllowed(url: navigationAction.request.url) {
            decisionHandler(.allow)
        } else {
            decisionHandler(.cancel)
        }
    }
    
    func isAllowed(url: URL?) -> Bool {
        guard let host = url?.host else {
            return false
        }
        if allowedSites.contains(where: host.contains) {
            return true
        }
        return false
    }
}
