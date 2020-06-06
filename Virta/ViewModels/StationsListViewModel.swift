//
//  StationsListViewModel.swift
//  Virta
//
//  Created by Tatiana Podlesnykh on 18.5.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import Foundation

class StationsListViewModel {
    
    private let service: StationService
    
    init() {
        self.service = StationService()
    }
    
    func getStations(_ result: @escaping ([BasicStationInfo]) -> ()) {
        self.service.getStationList { (stationList) in
            result(stationList)
        }
    }
}
