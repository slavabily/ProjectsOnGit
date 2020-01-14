//
//  Project.swift
//  ProjectsOnGit
//
//  Created by slava bily on 12/1/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import UIKit

struct Project: Codable {
    var title: String
    var subtitle: String
    
    var attributedTitle: NSAttributedString {
           let titleAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline),
               NSAttributedString.Key.foregroundColor: UIColor.purple]
           let subtitleAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .subheadline)]
           
           let titleString = NSMutableAttributedString(string: "\(title)\n", attributes: titleAttributes)
           let subtitleString = NSAttributedString(string: "\(subtitle)", attributes: subtitleAttributes)
           titleString.append(subtitleString)
           
           return titleString
       }
}
