//
//  URLComponentExtension.swift
//  Network
//
//  Created by Hemant Soni on 08/05/21.
//

import Foundation

/// Extension of URLComponent
extension URLComponents {
    
    /// Method  to convert a param dictionary [String: String]
    /// to an array of URLQueryItems
    /// used URLQueryItems to prevent from a Bad URL as it encodes the query param with percent encoding
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
