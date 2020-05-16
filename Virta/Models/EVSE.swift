//
//  EVSE.swift
//  Virta
//
//  Created by Tatiana Podlesnykh on 16.5.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import Foundation

struct EVSE: Codable {
    let id: Int?
    let connectors: [Connector]?
    let available: Bool?
    let reservable: Bool?
    let pricing: [Pricing]?
    let oneTimePayment: Bool?
    let status: Int?
    let minutesWithoutTimeCharge: Int?
    
    init(id: Int?, connectors: [Connector]?, available: Bool?, reservable: Bool?, pricing: [Pricing]?, oneTimePayment: Bool?, status: Int?, minutesWithoutTimeCharge: Int?) {
        self.id = id
        self.connectors = connectors
        self.available = available
        self.reservable = reservable
        self.pricing = pricing
        self.oneTimePayment = oneTimePayment
        self.status = status
        self.minutesWithoutTimeCharge = minutesWithoutTimeCharge
    }
}
