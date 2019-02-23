//
//  Recipe.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 27/11/2018.
//  Copyright © 2018 Gboyega. All rights reserved.
//

import Foundation

struct Recipe {
    var recipeName:String
    var recipeImage:String
    var curatorImage:String
    var tags:[Tag]
    var steps:[Step]
    var ingredients:[Ingredient]
    var servings:Int
    var time:Int
    var curatorID:Int
    var favoriteCount:Int
    
    static func loadRecipeData() -> [Recipe]{
            var recipeData = [
                Recipe(recipeName: "Pancakes", recipeImage: "image1", curatorImage: "avatar", tags: [Tag(tagName:"Quick Fix")], steps: [Step(text: "")], ingredients: [Ingredient(name: "Hello")], servings: 30, time: 30, curatorID: 100, favoriteCount: 10),
                Recipe(recipeName: "Pancakes", recipeImage: "image1", curatorImage: "avatar", tags: [Tag(tagName:"Quick Fix")], steps: [Step(text: "")], ingredients: [Ingredient(name: "Hello")], servings: 30, time: 30, curatorID: 100, favoriteCount: 10),
                Recipe(recipeName: "Pancakes", recipeImage: "image1", curatorImage: "avatar", tags: [Tag(tagName:"Quick Fix")], steps: [Step(text: "")], ingredients: [Ingredient(name: "Hello")], servings: 30, time: 30, curatorID: 100, favoriteCount: 10),
                Recipe(recipeName: "Pancakes", recipeImage: "image1", curatorImage: "avatar", tags: [Tag(tagName:"Quick Fix")], steps: [Step(text: "")], ingredients: [Ingredient(name: "Hello")], servings: 30, time: 30, curatorID: 100, favoriteCount: 10),
        ]
        
        return recipeData
    
    }
    
}

struct Ingredient {
    var name:String
    var product:Product?
    
    init(name:String,product:Product? = nil) {
        self.name = name
        self.product = product
    }
    
    static func loadIngredients() -> [Ingredient]{
        var ingredientData = [
            Ingredient(name: "Bacon"),Ingredient(name: "Cheese"),Ingredient(name: "Chicken"),Ingredient(name: "Fish"),Ingredient(name: "Lemon")
        ]
        
        return ingredientData
    }
}

struct Step {
    var text:String
    var imageURL:URL?
    
    init(text:String,imageURL:URL? = nil){
        self.text = text
        self.imageURL = imageURL
    }
    
    static func loadSteps() -> [Step]{
        var steps = [Step(text: "Wash Lemon"),Step(text: "Cut Fish"),Step(text: "Fry Cheese"),Step(text: "Mix Cheese with Bacon"),Step(text: "Boil Water")]
        
        return steps
    }
}

