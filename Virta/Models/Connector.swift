//
//  Connector.swift
//  Virta
//
//  Created by Tatiana Podlesnykh on 16.5.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import Foundation

struct Connector: Codable {
    
    public enum CurrentType: String, Codable {
        case ac = "AC"
        case dc = "DC"
    }
    
    let connectorID: Int?
    let type: ConnectorType?
    let currentType: CurrentType?
    let maxKw: Int?
    
    init(connectorID: Int?, type: ConnectorType?, currentType: CurrentType?, maxKw: Int?) {
        self.connectorID = connectorID
        self.type = type
        self.currentType = currentType
        self.maxKw = maxKw
    }
}
