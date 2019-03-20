//
//  ShoppingListController.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 02/03/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation
import RealmSwift



class ShoppingListController{
    //Load Favorites
    //AddFavorites
    //Delete Favorites
    
    static func loadItems() -> [ShoppingItem]?{
        //Load shopping items
        let realm = try! Realm()
        let items = realm.objects(ShoppingItem.self)
        
        return items.map({$0})
    }
    
    static func addItem(curatorName:String,recipeName:String,time:Int){
        //Takes in arguments to populate a Shopping Item Model that can then be persisted
        //While avoiding multiple enteries each element would possibly have a recipe id which can be checked
        let realm = try! Realm()
        let newItem = ShoppingItem()
        newItem.curatorName = curatorName
        newItem.recipeName = recipeName
        newItem.time = time
        
        do {
            try realm.write {
                realm.add(newItem)
            }
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    
    static func deleteFavorites(){
        //Checks for item using recipe ids then proceeds to delete it
        
        
    }
    
    
}
