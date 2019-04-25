//
//  Session.swift
//  myVK
//
//  Created by Дмитрий Яровой on 25/04/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import Foundation

class Session {
    
    static var instance = Session()
    
    private init(){}
    
    var token: String?
    var userID : Int?
    
}
