//
//  StationsListViewModel.swift
//  Virta
//
//  Created by Tatiana Podlesnykh on 18.5.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import Foundation
import CoreLocation

class StationsListViewModel {
    
    private let service: StationService
    
    init() {
        self.service = StationService()
    }
    
    func getStations(_ manager: CLLocationManager, _ result: @escaping ([BasicStationInfo]) -> ()) {
        self.service.getStationList(manager) { (stationList) in
            result(stationList)
        }
    }
}
