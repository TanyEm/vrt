//
//  File.swift
//  Virta
//
//  Created by Tatiana Podlesnykh on 17.5.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import Foundation

// It contains all the needed routes/endpoints/paths.
public enum HTTPNetworkRoute: String {
    
    case postAuth = "auth"
    case getNearesStations = "stations"
    case editPost = "stations/:id"
}
