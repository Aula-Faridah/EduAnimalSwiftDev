//
//  Bundle+Ext.swift
//  EduAnimalSwiftDev
//
//  Created by MacBook Pro on 02/05/24.
//

import Foundation

// To decode JSON data into a bundle (local data)
// so it can be reused anytime anywhere all at once
extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        // 1. Localizing the JSON file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        // 2. Set and load data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        // 3. Initializing decoder
        let decoder = JSONDecoder()
        
        //4. Save it as a property of the decoded JSON data.
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        // 5. Return data that ready-to-use
        return loaded
    }
    
}
