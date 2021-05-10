//
//  RequestProtocol.swift
//  Network
//
//  Created by Hemant Soni on 08/05/21.
//

import Foundation

/// This is the Request protocol you may implement as enum
/// or as a classic class object for each kind of request.
public protocol Request {
    /// set environment (i.e schema, baseURL, Header)
    var environment: Environment { get }
    
    /// Relative path of the endpoint we want to call (ie. `/users/login`)
    var path: String { get }
    
    /// This define the HTTP method we should use to perform the call
    /// We have defined it inside an String based enum called `HTTPMethod`
    /// just for clarity
    var method: HTTPMethod { get }
    
    /// These are the parameters we need to send along with the call.
    /// Params can be passed into the body or along with the URL
    var queryParameters: [String: String] { get }
    
    /// These are the parameters we need to send along with the call.
    /// Params can be passed into the body fir Post request
    var bodyParameters: [String: Any] { get }
}


/// This define the type of HTTP method used to perform the request
///
/// - post: POST method
/// - put: PUT method
/// - get: GET method
/// - delete: DELETE method
/// - patch: PATCH method
public enum HTTPMethod: String {
    case post = "POST"
    case put = "PUT"
    case get = "GET"
    case delete = "DELETE"
    case patch = "PATCH"
}

