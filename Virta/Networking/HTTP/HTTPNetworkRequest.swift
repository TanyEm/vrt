//
//  HTTPNetworkRequest.swift
//  Virta
//
//  Created by Tatiana Podlesnykh on 17.5.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import Foundation

public typealias HTTPParameters = [String: Any]?
public typealias HTTPHeaders = [String: Any]?

struct HTTPNetworkRequest {
    
    // Here we set up the body, method, headers, and parameters of the request
    static func configureHTTPRequest(from route: HTTPNetworkRoute, with parameters: HTTPParameters, includes headers: HTTPHeaders, contains body: Data?, and method: HTTPMethod) throws -> URLRequest {
        
        guard let url = URL(string: "https://apitest.virta.fi/v4\(route.rawValue)") else { throw HTTPNetworkError.missingURL}
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
        
        request.httpMethod = method.rawValue
        request.httpBody = body
        try configureParametersAndHeaders(parameters: parameters, headers: headers, request: &request)
        
        return request
    }
    
    // Here we configure the request parameters and headers before the API call
    static func configureParametersAndHeaders(parameters: HTTPParameters?,
                                         headers: HTTPHeaders?,
                                         request: inout URLRequest) throws {

        do {

            if let headers = headers, let parameters = parameters {
                try URLEncoder.encodeParameters(for: &request, with: parameters)
                try URLEncoder.setHeaders(for: &request, with: headers)
            }
        } catch {
            throw HTTPNetworkError.encodingFailed
        }
    }
    
}
