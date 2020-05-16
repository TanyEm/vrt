//
//  Pricing.swift
//  Virta
//
//  Created by Tatiana Podlesnykh on 16.5.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import Foundation

struct Pricing: Codable {

    let name: String?
    let priceCents: Double?
    let currency: String?
    let minutes: Int?
    
    init(name: String?, priceCents: Double?, currency: String?, minutes: Int?) {
        self.name = name
        self.priceCents = priceCents
        self.currency = currency
        self.minutes = minutes
    }
}
