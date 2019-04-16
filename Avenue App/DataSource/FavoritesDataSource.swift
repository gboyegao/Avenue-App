//
//  FavoritesDataSource.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 22/02/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation
import UIKit

public class FavoritesDataSource: NSObject {
    let favorites: [Favorite]
    
    init(favorites: [Favorite]) {
        self.favorites = favorites
    }
    
    func favorite(at indexPath: IndexPath) -> Favorite {
        return self.favorites[indexPath.row]
    }
}

extension FavoritesDataSource: UITableViewDataSource,UITableViewDelegate {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.favorites.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cell(for: favorite(at: indexPath),tableView:tableView,indexPath: indexPath)
    }
    
    func cell(for favorite: Favorite,tableView: UITableView,indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell") as! FavoritesTableViewCell
        cell.update(favorite: favorite)
        return cell
    }
}
