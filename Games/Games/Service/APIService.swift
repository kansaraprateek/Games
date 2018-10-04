//
//  APIService.swift
//  Games
//
//  Created by Prateek Kansara on 03/10/18.
//  Copyright © 2018 Prateek. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String:Any]

/// Service class to fetch and create a model array for the JSON returned from the given API.
class APIService {
    
    
    /// Given Game url
    private let gamesURL = URL(string: "https://api.unibet.com/game-library-rest-api/getGamesByMarketAndDevice.json?jurisdiction=UK&brand=unibet&deviceGroup=mobilephone&locale=en_GB&currency=GBP&categories=casino,softgames&clientId=casinoapp")!
    
    
    /// Method to load JSON data into Game model array.
    ///
    /// - Parameter completion: Handler to update the UI when the data is downlaoded and converted from JSON to model class.
    func loadGames(completion :@escaping ([Game]) -> ()) {
        
        if UtilityMethods.isInternetAvailable(){
            
            URLSession.shared.dataTask(with: gamesURL) { data, _, error in
                
                if let data = data { 
                    let json = try! JSONSerialization.jsonObject(with: data, options: [])
                    let gamesDictionary = json as! JSONDictionary
                    let dictionary = gamesDictionary["games"] as! JSONDictionary
                    
                    var gamesDictionaries = [JSONDictionary]()
                    for dict in dictionary{
                        gamesDictionaries.append(dict.value as! JSONDictionary)
                    }
                    
                    let games = gamesDictionaries.compactMap(Game.init)
                    DispatchQueue.main.async {
                        PKStatusBarLoader.show(withMessage: "Games downloaded successfully!")
                        completion(games)
                    }
                    
                }else if let error = error{
                    
                    DispatchQueue.main.async {
                        PKStatusBarLoader.show(withMessage: "Failed to download Games!")
                    }
                    
                    print(error)
                }
                }.resume()
        }
    }
}
