//
//  StationDetailsViewModel.swift
//  Virta
//
//  Created by Tatiana Podlesnykh on 19.5.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import Foundation

class StationDetailsViewModel {
    
    private let service: StationService
    
    init() {
        self.service = StationService()
    }
    
    func getStationDetails(id: Int, _ result: @escaping (Station) -> ()) {
        service.getStationByID(id: id) { (details) in
            result(details)
        }
    }
    
}
