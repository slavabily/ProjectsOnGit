//
//  Bundle+Decoding.swift
//  ProjectsOnGit
//
//  Created by slava bily on 14/1/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(from fileName: String) -> T {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            fatalError("Failed to locate \(fileName) in app bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to locate \(fileName) in app bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(fileName) from app bundle.")
        }
        return loaded
    }
}
