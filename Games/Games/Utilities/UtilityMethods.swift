//
//  UtilityMethods.swift
//  Games
//
//  Created by Prateek Kansara on 03/10/18.
//  Copyright © 2018 Prateek. All rights reserved.
//

import Foundation

/// Basic Utility mehtods to be used across the project.
class UtilityMethods {
    
    //MARK:- Internet Reachability
    class func isInternetAvailable() -> Bool {
        let reachability = Reachability.init()!
        return reachability.connection != .none
    }
}
