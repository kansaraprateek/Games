//
//  GameListViewModel.swift
//  Games
//
//  Created by Prateek Kansara on 03/10/18.
//  Copyright © 2018 Prateek. All rights reserved.
//

import Foundation
import UIKit

class GamesListViewModel : NSObject {
    
    private var webservice : APIService
    @objc dynamic private(set) var gameViewModels : [GameViewModel] = [GameViewModel]()
    var bindToGameViewModels :(() -> ()) = {  }
    private var token :NSKeyValueObservation?
    
    init(webservice :APIService) {
        
        self.webservice = webservice
        super.init()
        
        token = self.observe(\.gameViewModels) { _,_ in
            self.bindToGameViewModels()
        }
        
        populateGames()
    }
    
    func invalidateObservers() {
        self.token?.invalidate()
    }
    
    func populateGames() {
        
        self.webservice.loadGames{ [unowned self]
            games in
            self.gameViewModels = games.compactMap(GameViewModel.init)
        }
    }
    
    func game(at index : Int) -> GameViewModel {
        return self.gameViewModels[index]
    }
}
