//
//  AuthRequest.swift
//  Virta
//
//  Created by Tatiana Podlesnykh on 17.5.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import Foundation

struct AuthRequest {
    
    static let shared = AuthRequest()
    let authSession = URLSession(configuration: .default)
    let header = ["Content-Type":"application/json"]
    
    func getAuth(email: String, password: String, _ completion: @escaping (Result<AuthToken>) -> ()) {
        
        let authRequest = Auth(email: email, code: password)
        var httpRequestBody: Data?
        
        do {
           httpRequestBody = try JSONSerialization.data(withJSONObject: authRequest, options: [])
        } catch let error {
            print(error)
            return
        }
            
        do{
            let request = try HTTPNetworkRequest.configureHTTPRequest(from: .postAuthResource, with: nil, includes: header, contains: httpRequestBody, and: .post)
            
            authSession.dataTask(with: request) { (data, res, err) in
                
                if let response = res as? HTTPURLResponse, let unwrappedData = data {
                    
                    let result = HTTPNetworkResponse.handleNetworkResponse(for: response)
                    switch result {
                
                    case .success:
                        let result = try? JSONDecoder().decode(AuthToken.self, from: unwrappedData)
                        completion(Result.success(result!))
                    case .failure:
                        completion(Result.failure(HTTPNetworkError.decodingFailed))
                    }
                }
            }.resume()
        }catch{
            
            completion(Result.failure(HTTPNetworkError.badRequest))
        }
    }
}
