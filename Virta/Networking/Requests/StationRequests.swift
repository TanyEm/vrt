//
//  StationRequest.swift
//  Virta
//
//  Created by Tatiana Podlesnykh on 17.5.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import Foundation

struct StationRequest {
    static let shared = AuthRequest()
    let stationSession = URLSession(configuration: .default)
    let header = ["Content-Type":"application/json"]
    
    let stationsLimit = 10
    
    func getStations(latMin: Double, latMax: Double, longMin: Double, longMax: Double, _ completion: @escaping (Result<[BasicStationInfo]>) -> ()) {
        
        let parameters = [
            "latMin": latMin,
            "latMax": latMax,
            "longMin": longMin,
            "longMax": longMax,
            "limit": stationsLimit
        ] as HTTPParameters
        
        do{
            let request = try HTTPNetworkRequest.configureHTTPRequest(from: .getStationsResource.rawValue, with: parameters, includes: header, contains: nil, and: .get)
            
            stationSession.dataTask(with: request) { (data, res, err) in
                
                if let response = res as? HTTPURLResponse, let unwrappedData = data {
                    
                    let result = HTTPNetworkResponse.handleNetworkResponse(for: response)
                    switch result {
                
                    case .success:
                        let result = try? JSONDecoder().decode([BasicStationInfo].self, from: unwrappedData)
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
    
    func getStationByID(id: Int, _ completion: @escaping (Result<Station>) -> ()) {
        
        let path = "\(HTTPNetworkRoute.getStationsResource)/\(id)"
        
        do{
            let request = try HTTPNetworkRequest.configureHTTPRequest(from: path, with: nil, includes: header, contains: nil, and: .get)
            
            stationSession.dataTask(with: request) { (data, res, err) in
                
                if let response = res as? HTTPURLResponse, let unwrappedData = data {
                    
                    let result = HTTPNetworkResponse.handleNetworkResponse(for: response)
                    switch result {
                
                    case .success:
                        let result = try? JSONDecoder().decode(Station.self, from: unwrappedData)
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
