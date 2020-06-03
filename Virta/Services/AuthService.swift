//
//  AuthService.swift
//  Virta
//
//  Created by Tatiana Podlesnykh on 18.5.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

class AuthService {
    func auth(email: String, password: String, _ authorized: @escaping (Bool) -> ()) {
        let authRequest = AuthRequest()
        
        authRequest.getAuth(email: email, password: password) { result in
            switch result {
            case .success(let authToken):
                let tokenSaved: Bool = KeychainWrapper.standard.set("token", forKey: authToken.token)

                if tokenSaved {
                    authorized(true)
                } else {
                    authorized(false)
                }
            case .failure(let error):
                print(error)
                authorized(false)
            }
        }
    }
}
