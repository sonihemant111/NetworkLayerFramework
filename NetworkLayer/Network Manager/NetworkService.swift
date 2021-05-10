//
//  NetworkService.swift
//  Network
//
//  Created by Hemant Soni on 08/05/21.
//

import Foundation

public enum NetworkError: Error {
    case badURL, requestFailed, unknown, noDataFound
}

public class NetworkService {
    
    /// Method that takes the input to prepare a request and call the network service
    /// This is a generic method that can handle the all request of  GET, PUT, POST, DELETE  HTTP Method type
    ///
    /// - Parameter request: Input a request and it is an instance of  type that conforms the request protocol
    /// - Parameter completion: A closure which is called with a result type with success or failure
    ///
    public class func request(request: Request, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        
        var components = URLComponents()
        components.scheme = request.environment.name
        components.host = request.environment.host
        components.path = request.path
        if request.method == .get {
            components.setQueryItems(with: request.queryParameters)
        }
        
        let session = URLSession(configuration: .default)
        guard let url = components.url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.environment.headers
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        if request.method != .get {
            let bodyData = try? JSONSerialization.data(withJSONObject: request.bodyParameters, options: [])
            urlRequest.httpBody = bodyData
        }
        
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            
            // the task has completed – push our work back to the main thread
            DispatchQueue.main.async {
                guard error == nil else {
                    print(error?.localizedDescription as Any)
                    completion(.failure(.requestFailed))
                    return
                }
                guard response != nil else {
                    print("no response")
                    completion(.failure(.noDataFound))
                    return
                }
                guard let data = data else {
                    // this ought not to be possible, yet here we are
                    completion(.failure(.unknown))
                    return
                }
                completion(.success(data))
            }
            
        }
        dataTask.resume()
    }
}
