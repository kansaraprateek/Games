//
//  GameViewModel.swift
//  Games
//
//  Created by Prateek Kansara on 03/10/18.
//  Copyright © 2018 Prateek. All rights reserved.
//

import Foundation
class GameViewModel: NSObject{
    
    var id : String?
    var name : String?
    
    var playURL : String? = nil
    var launchLocale : String? = nil
    var imageUrl : String? = nil
    
    var backgroundImageUrl : String? = nil
    
    var vendorId : String? = nil
    
    var tags = [String]()
    var licenses = [String]()
    
    
    init(gameObject : Game) {
        self.id                 = gameObject.gameId
        self.name               = gameObject.gameName
        self.playURL            = gameObject.playURL
        self.launchLocale       = gameObject.launchLocale
        self.imageUrl           = gameObject.imageUrl
        self.backgroundImageUrl = gameObject.backgroundImageUrl
        self.vendorId           = gameObject.vendorId
        self.tags               = gameObject.tags
        self.licenses           = gameObject.licenses
    }
}
