//
//  ConnectorType.swift
//  Virta
//
//  Created by Tatiana Podlesnykh on 16.5.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import Foundation

enum ConnectorType: String, Codable {
    case ccs = "CCS"
    case chademo = "CHAdeMO"
    case type2 = "Type2"
    case type3 = "Type3"
    case shuko = "Shuko"
    case schuko = "Schuko"
    case mennekes = "Mennekes"
}
