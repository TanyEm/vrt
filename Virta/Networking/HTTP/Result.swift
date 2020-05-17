//
//  Result.swift
//  Virta
//
//  Created by Tatiana Podlesnykh on 17.5.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import Foundation

import Foundation

/*
 The Result needed just to know the type of results we will return at the end.
 The enumeration tells us that after our network request with URLSession is done,
 we might either get data(success) or get an error(failure).
 */
enum Result<T> {
    
    case success(T)
    case failure(Error)
}
