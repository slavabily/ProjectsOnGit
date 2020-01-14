//
//  WebView+LoadString.swift
//  ProjectsOnGit
//
//  Created by slava bily on 14/1/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import Foundation
import WebKit

extension WKWebView {
    func load(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        let request = URLRequest(url: url)
        load(request)
    }
}
