//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Tugay Emre Yucedag on 4.03.2023.
//

import Foundation

/// Object that represents a singlet API call 
final class RMRequest {
    /// Api constants
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
        
    }
    
    /// Desired endpoint
    private let endpoint: RMEndpoint
    
    /// Path components for API, if any
    private let pathComponents: Set<String>
    
    /// Query arguments for API, if any
    private let queryParameters: [URLQueryItem]
    
    /// Constructed url for the api request in string  format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach {
                string += "/\($0)"
            }
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            // name=vale&name=value
            let argumentString = queryParameters.compactMap {
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            }.joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    /// Computed & constructed API url
    public var url: URL? {
        URL(string: urlString)
    }
    
    /// Desired http method
    public let httpMethod = "GET"
    
    //Mark: - Public
    
    /// Construct request
    /// - Parameters:
    ///   - endpoint: Target endpoint
    ///   - pathComponents: Collection of path components
    ///   - queryParameters: Collection of query parameters
    public init(endpoint: RMEndpoint, pathComponents: Set<String> = [], queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
}
