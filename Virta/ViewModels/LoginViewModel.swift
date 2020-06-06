//
//  LoginViewModel.swift
//  Virta
//
//  Created by Tatiana Podlesnykh on 18.5.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import Foundation
import UIKit

public class LoginViewModel {
        
    private let service: AuthService
    
    var loginButton: Bool?
    
    init() {
        self.service = AuthService()
    }
    
    func login(email: String, password: String, _ loggedIn: @escaping (Bool) -> ()) {
        service.auth(email: email, password: password) { (autorized) in
            loggedIn(autorized)
        }
    }
}
