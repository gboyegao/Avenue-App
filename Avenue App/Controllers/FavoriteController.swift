//
//  FavoriteController.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 27/02/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation
import RealmSwift


class FavoriteController{
    //Load Favorites
    //AddFavorites
    //Delete Favorites
    
    static func loadFavorites()  -> [Favorite]?{
        //Load Favorites
        let realm = try! Realm()
        let items = realm.objects(Favorite.self)
        return items.map({$0})
    }
    
    static func makeFavorite(){}
    static func removeFavorite(){}
    
}
