//
//  Environment.swift
//  Network
//
//  Created by Hemant Soni on 08/05/21.
//

import Foundation

/// Environment is a struct which encapsulate all the informations
/// we need to perform a setup of our Networking Layer.
/// In this example we just define the name of the environment (ie. Production,
/// Test Environment #1 and so on) and the base url to complete requests.
/// You may also want to include any SSL certificate or wethever you need.
public struct Environment {
    
    /// Name of the environment
    public var name: String
    
    /// Base URL of the environment
    public var host: String
    
    /// This is the list of common headers which will be part of each Request
    /// Some headers value maybe overwritten by Request's own headers
    public var headers: [String: String] = [:]
    
    /// Cache policy
    public var cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData
    
    /// Initialize a new Environment
    ///
    /// - Parameters:
    ///   - name: name of the environment
    ///   - host: base url
    public init(name: String, host: String) {
        self.name = name
        self.host = host
    }
}
