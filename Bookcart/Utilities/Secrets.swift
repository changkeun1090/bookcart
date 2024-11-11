//
//  Secret.swift
//  Bookcart
//
//  Created by ChangKeun Ji on 11/7/24.
//

import Foundation

struct Secrets {
    static var apiKey: String {
        guard let path = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
              let dictionary = NSDictionary(contentsOfFile: path),
              let apiKey = dictionary["API_KEY"] as? String else {
            fatalError("API Key not found")
        }
        return apiKey
    }
}
