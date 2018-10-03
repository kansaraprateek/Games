//
//  GameModel.swift
//  Games
//
//  Created by Prateek Kansara on 03/10/18.
//  Copyright © 2018 Prateek. All rights reserved.
//

import Foundation


/// Game Model for storing and handling data temporary.
class Game{
    
    var gameName : String? = nil
    var gameId : String!
    var playURL : String? = nil
    var launchLocale : String? = nil
    var imageUrl : String? = nil
    
    var backgroundImageUrl : String? = nil
    
    var vendorId : String? = nil
    
    var tags = [String]()
    var licenses = [String]()
    
    init?(gameDict :JSONDictionary) {
        self.gameId = gameDict["gameId"] as? String
        
        if let gameName = gameDict["gameName"] as? String{
            self.gameName = gameName
        }
        
        if let launchLocale = gameDict["launchLocale"] as? String{
            self.launchLocale = launchLocale
        }
        
        if let playURL = gameDict["playURL"] as? String{
            self.playURL = playURL
        }
        
        if let imageUrl = gameDict["imageUrl"] as? String{
            self.imageUrl = imageUrl
        }
        
        if let backgroundImageUrl = gameDict["backgroundImageUrl"] as? String{
            self.backgroundImageUrl = backgroundImageUrl
        }
        
        if let vendorId = gameDict["vendorId"] as? String{
            self.vendorId = vendorId
        }
        
        if let tags = gameDict["tags"] as? NSArray{
            for tag in tags{
                self.tags.append(tag as! String)
            }
        }
        
        if let licenses = gameDict["licenses"] as? NSArray{
            for license in licenses{
                self.licenses.append(license as! String)
            }
        }
    }
    
    init(gameViewObject : GameViewModel) {
        self.gameId             = gameViewObject.id
        self.gameName           = gameViewObject.name
        self.playURL            = gameViewObject.playURL
        self.launchLocale       = gameViewObject.launchLocale
        self.imageUrl           = gameViewObject.imageUrl
        self.backgroundImageUrl = gameViewObject.backgroundImageUrl
        self.vendorId           = gameViewObject.vendorId
        self.tags               = gameViewObject.tags
        self.licenses           = gameViewObject.licenses
    }
}
