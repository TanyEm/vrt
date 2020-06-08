//
//  StationsService.swift
//  Virta
//
//  Created by Tatiana Podlesnykh on 18.5.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import Foundation
import CoreLocation

class StationService {
    
    func getStationList(_ manager: CLLocationManager, _ listed: @escaping ([BasicStationInfo]) -> ()) {
        
        var latMin = 0.0
        var latMax = 0.0
        var longMin = 0.0
        var longMax = 0.0
        var userLocation = CLLocationCoordinate2D()
        
        if manager.location?.coordinate == nil {
            latMin = 50.1
            latMax = 70.3
            longMin = 14.6
            longMax = 24.8
        } else {
            userLocation = manager.location!.coordinate
            latMin = userLocation.latitude - 10.0
            latMax = userLocation.latitude + 10.0
            longMin = userLocation.longitude - 10.0
            longMax = userLocation.longitude + 10.0
        }
        
        let stationRequest = StationRequest()
        
        stationRequest.getStations(latMin: latMin, latMax: latMax, longMin: longMin, longMax: longMax) { (result) in
            switch result {
            case .success(var data):
                
                for i in data.indices {
                    let loc1 = CLLocation(latitude: data[i].latitude!, longitude: data[i].longitude!)
                    
                    if (userLocation.latitude != 0) && (userLocation.longitude != 0) {
                        let loc2 = CLLocation(latitude: userLocation.latitude, longitude: userLocation.longitude)
                        let distance = loc1.distance(from: loc2)
                        data[i].distanceFromUser = distance
                    } else {
                        data[i].distanceFromUser = Double(i)
                    }
                }
                
                let dataSorted = data.sorted {
                    Double($0.distanceFromUser!) > Double($1.distanceFromUser!)
                }
                
                listed(dataSorted)
            case .failure(let error):
                print("Error: failed to get stations list \(error)")
            }
        }
    }
    
    func getStationByID(id: Int, _ viewed: @escaping (Station) -> ()) {
        let stationRequest = StationRequest()
        
        stationRequest.getStationByID(id: id) { (result) in
            switch result {
            case .success(let station):
                viewed(station)
            case .failure(let error):
                print("Error: failed to get station by id:\(id); error: \(error)")
            }
        }
    }
    
}
