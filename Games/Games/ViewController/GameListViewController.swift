//
//  GameListViewController.swift
//  Games
//
//  Created by Prateek Kansara on 03/10/18.
//  Copyright © 2018 Prateek. All rights reserved.
//

import Foundation
import UIKit

class GameTableViewController: UITableViewController {

    private var webservice :APIService!
    private var gameListViewModel :GameListViewModel!
    private var dataSource :TableViewDataSource<GameTableViewCell,GameViewModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Games"
        
        updateUI()
    }
    
    func updateUI() {
        
        // Table UI setup
        self.tableView.estimatedRowHeight = 130
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.tableFooterView = UIView(frame: .zero)
        
        self.webservice = APIService()
        self.gameListViewModel = GameListViewModel(webservice: self.webservice)
        
        // setting up the bindings
        self.gameListViewModel.bindToGameViewModels = {
            self.updateDataSource()
        }
    }
    
    /// Update table Data source
    private func updateDataSource() {
        
        PKStatusBarLoader.dismiss()
        
        self.dataSource = TableViewDataSource(cellIdentifier: Cells.game, items: self.gameListViewModel.gameViewModels) { cell, vm in
            cell.nameLabel.text = vm.name
            cell.backgroundImageView.downloadedFrom(url: vm.backgroundImageUrl ?? "", placeholderImage: nil)
        }
        
        self.tableView.dataSource = self.dataSource
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
}
