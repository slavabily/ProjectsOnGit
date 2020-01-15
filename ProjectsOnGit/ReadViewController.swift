//
//  ReadViewController.swift
//  ProjectsOnGit
//
//  Created by slava bily on 13/1/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import UIKit
import WebKit

class ReadViewController: UIViewController, Storyboarded {
    
    var webView = WKWebView()
    var project: Project!
    
    var navigationDelegate = NavigationDelegate()
    
    override func loadView() {
        
        webView.navigationDelegate = navigationDelegate
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        assert(project != nil, "You must set a project before show this view controller.")
        title = project.title
        
        webView.load("https://github.com/slavabily/\(project.title)")
    }
}
