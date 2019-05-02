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
    
    static func makeFavorite(recipeID:String,curatorName:String,recipeImage:String,recipeName:String,time:Int) -> Void{
        let realm = try! Realm()
        let favorite = Favorite()
        favorite.curatorName = curatorName
        favorite.recipeID = recipeID
        favorite.recipeImage = recipeImage
        favorite.recipeName = recipeName
        favorite.time = time
        
        do{
            try realm.write {
                realm.add(favorite)
            }
        }
        catch{
            print(error.localizedDescription)
        }
        
        return
    }
    static func removeFavorite(id:String){
        let realm = try! Realm()
        
        let items = realm.objects(Favorite.self)
        
        let currentItem = items.filter("recipeID = '\(id)' ")
        try! realm.write {
            realm.delete(currentItem)
        }
    }
    
    static func faveExistsInDB(id:String) -> Bool{
        let realm = try! Realm()
        
        let items = realm.objects(Favorite.self)
        
        let currentItem = items.filter("recipeID = '\(id)' ")
        
        guard currentItem.first != nil else {
            return false
        }
        
        return true
    }
    
}
