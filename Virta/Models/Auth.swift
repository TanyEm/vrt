//
//  Auth.swift
//  Virta
//
//  Created by Tatiana Podlesnykh on 17.5.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import Foundation

struct Auth: Codable {
    let email: String?
    let code: String?
    
    init(email:String?, code:String?) {
        self.email = email
        self.code = code
    }
}

struct AuthToken: Codable {
    let token: String?
    
    init(token:String?) {
        self.token = token
    }
}
