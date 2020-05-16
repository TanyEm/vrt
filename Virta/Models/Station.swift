//
//  Station.swift
//  Virta
//
//  Created by Tatiana Podlesnykh on 16.5.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import Foundation

struct Station: Codable {

    let id: Int?
    let name: String?
    let latitude: Double?
    let longitude: Double?
    let icon: Int?
    let address: String?
    let city: String?
    let openHours: String?
    let provider: String?
    let pictures: [String]?
    let evses: [EVSE]?
    let alertMessage: String?
    
    init(id: Int?, name: String?, latitude: Double?, longitude: Double?, icon: Int?, address: String?, city: String?, openHours: String?, provider: String?, pictures: [String]?, evses: [EVSE]?, alertMessage: String?) {
        self.id = id
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.icon = icon
        self.address = address
        self.city = city
        self.openHours = openHours
        self.provider = provider
        self.pictures = pictures
        self.evses = evses
        self.alertMessage = alertMessage
    }
}
