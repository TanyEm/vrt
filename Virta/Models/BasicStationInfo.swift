//
//  Stations.swift
//  Virta
//
//  Created by Tatiana Podlesnykh on 16.5.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import Foundation

struct BasicStationInfo: Codable {

    let id: Int?
    let latitude: Double?
    let longitude: Double?
    let name: String?
    let city: String?
    let address: String?
    let provider: String?
    let evses: [Connector]?
    let icon: Int?
    let isRemoved: Bool?
    let isPrivate: Bool?
    
    
    init(id: Int?, latitude: Double?, longitude: Double?, name: String?, city: String?, address: String?, provider: String?, evses: [Connector]?, icon: Int?, isRemoved: Bool?, isPrivate: Bool?) {
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
        self.city = city
        self.address = address
        self.provider = provider
        self.evses = evses
        self.icon = icon
        self.isRemoved = isRemoved
        self.isPrivate = isPrivate
    }
}


