//
//  RealmModels.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 02/03/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation
import RealmSwift


class User:Object{
    @objc dynamic var ID = ""
    @objc dynamic var firstName = "Julian Funmi"
    @objc dynamic var lastName = "Julian Funmi"
    @objc dynamic var email = "Julian Funmi"
    
}


class ShoppingIngredients:Object{
    @objc dynamic var name = "Rice"
    @objc dynamic var quantity = "3 Dericas"
    
}

class ShoppingList:Object{
    let items = List<ShoppingItem>()
}

class ShoppingItem:Object{
    @objc dynamic var curatorName = "Julian Funmi"
    @objc dynamic var recipeName = "Chicken Shawarma"
    @objc dynamic var recipeImage = ""
    @objc dynamic var recipeID = ""
    @objc dynamic var time = Int()
    
    var ingredients = List<ShoppingIngredients>()
    
    
    
    static func loadLists() -> [ShoppingList]{
        let lists = [ShoppingList(),ShoppingList(),ShoppingList()]
        
        return lists
    }
    
}

class Favorite:Object{
    
    @objc dynamic var recipeID = ""
    @objc dynamic var recipeName = ""
    @objc dynamic var curatorName = ""
    @objc dynamic var recipeImage = ""
    @objc dynamic var time = Int()
    
    
    static func loadFavorites() -> [Favorite]{
        let favorite1 = Favorite()
        favorite1.recipeName = "Rice and Peas"
        favorite1.curatorName = "Chef Fregz"
        favorite1.time = 10
        
        let favorites = [favorite1,favorite1,favorite1]
        
        return favorites
    }
    
}


  
