//
//  StationsService.swift
//  Virta
//
//  Created by Tatiana Podlesnykh on 18.5.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import Foundation

class StationListService {
    // location: 60.2, 24.7
    let latMin = 50.1
    let latMax = 70.3
    let longMin = 14.6
    let longMax = 24.8
    
    func getStationList( _ listed: @escaping ([BasicStationInfo]) -> ()) {
        let stationRequest = StationRequest()
        
        stationRequest.getStations(latMin: latMin, latMax: latMax, longMin: longMin, longMax: longMax) { (result) in
            switch result {
            case .success(let data):
                listed(data)
            case .failure(let error):
                print("Error: failed to get stations list \(error)")
            }
        }
    }
    
}
