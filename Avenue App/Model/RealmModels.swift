//
//  RealmModels.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 02/03/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation
import RealmSwift


class ShoppingIngredients:Object{
    @objc dynamic var name = "Rice"
    @objc dynamic var quantity = "3 Dericas"
    let shoppingItem = LinkingObjects(fromType:ShoppingItem.self,property:"ingredients")
}

class ShoppingList:Object{
    let items = List<ShoppingItem>()
}

class ShoppingItem:Object{
    @objc dynamic var curatorName = "Julian Funmi"
    @objc dynamic var recipeName = "Chicken Shawarma"
    @objc dynamic var time = Int()
    
    let ingredients = List<ShoppingIngredients>()
    
    
    
    static func loadLists() -> [ShoppingList]{
        let lists = [ShoppingList(),ShoppingList(),ShoppingList()]
        
        return lists
    }
    
}

class Favorites:Object{
    
}


