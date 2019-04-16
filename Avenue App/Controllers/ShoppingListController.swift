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
    
    static func loadItem(id:String) -> ShoppingItem?{
        let realm = try! Realm()
        
        let items = realm.objects(ShoppingItem.self)

        let currentItem = items.filter("recipeID = '\(id)' ")
        
        return currentItem.first
    }
    
    
    
    static func loadItems() -> [ShoppingItem]?{
        //Load shopping items
        let realm = try! Realm()
        let items = realm.objects(ShoppingItem.self)
        
        return items.map({$0})
    }
    
    static func addItem(recipeID:String,curatorName:String,recipeName:String,time:Int,ingredients:[Ingredient],recipeImage:String){
        //Takes in arguments to populate a Shopping Item Model that can then be persisted
        //While avoiding multiple enteries each element would possibly have a recipe id which can be checked
        let realm = try! Realm()
        let newItem = ShoppingItem()
        newItem.curatorName = curatorName
        newItem.recipeName = recipeName
        newItem.time = time
        newItem.recipeID = recipeID
        newItem.recipeImage = recipeImage
        
        ingredients.forEach{
            ingredient in
            let shoppingIngredient = ShoppingIngredients()
            shoppingIngredient.name = ingredient.name
            shoppingIngredient.quantity = ingredient.quantity
            newItem.ingredients.append(shoppingIngredient)
            
        }
        
        
        
        
        
        do {
            try realm.write {
                realm.add(newItem)
            }
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    
    static func deleteItem(with id:String){
        //Checks for item using recipe ids then proceeds to delete it
        let realm = try! Realm()
        
        let items = realm.objects(ShoppingItem.self)
        
        let currentItem = items.filter("recipeID = '\(id)' ")

        try! realm.write {
            realm.delete(currentItem)
        }

    }
    
    static func itemExistsinDB(with id:String) -> Bool{
        guard loadItem(id: id) != nil else { return false }
        
        return true
        
    }
    
    
}
