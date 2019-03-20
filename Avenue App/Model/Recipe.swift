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
            let recipeData = [
                Recipe(recipeName: "Pancakes", recipeImage: "image1", curatorImage: "avatar", tags: [Tag(tagName:"Quick Fix")], steps: [Step(text: "")], ingredients: Ingredient.loadIngredients(), servings: 30, time: 30, curatorID: 100, favoriteCount: 10),
                Recipe(recipeName: "Pancakes", recipeImage: "image1", curatorImage: "avatar", tags: [Tag(tagName:"Quick Fix")], steps: [Step(text: "")], ingredients: Ingredient.loadIngredients(), servings: 30, time: 30, curatorID: 100, favoriteCount: 10),
                Recipe(recipeName: "Pancakes", recipeImage: "image1", curatorImage: "avatar", tags: [Tag(tagName:"Quick Fix")], steps: [Step(text: "")], ingredients: Ingredient.loadIngredients(), servings: 30, time: 30, curatorID: 100, favoriteCount: 10),
                Recipe(recipeName: "Pancakes", recipeImage: "image1", curatorImage: "avatar", tags: [Tag(tagName:"Quick Fix")], steps: [Step(text: "")], ingredients: Ingredient.loadIngredients(), servings: 30, time: 30, curatorID: 100, favoriteCount: 10),
        ]
        
        return recipeData
    
    }
    
}

struct Ingredient {
    var name:String
    var quantity:String
    
    init(name:String,quantity:String) {
        self.name = name
        self.quantity = quantity
    }
    
    static func loadIngredients() -> [Ingredient]{
        let ingredientData = [
            Ingredient(name: "Bacon",quantity:"3sp"),Ingredient(name: "Cheese",quantity:"4sp"),Ingredient(name: "Chicken",quantity:"3sp"),Ingredient(name: "Fish",quantity:"3sp"),Ingredient(name: "Lemon",quantity:"3sp")
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
        let steps = [Step(text: "Wash Lemon Wash Lemon Wash Lemon Wash Lemon Wash Lemon Wash Lemon Wash Lemon Wash Lemon Wash Lemon Wash Lemon Wash Lemon Wash Lemon Wash Lemon Wash Lemon Wash Lemon Wash Lemon", imageURL: URL(string: "https://techcrunch.com/wp-content/uploads/2019/03/Team-Mobot.png") ),Step(text: "Cut Fish"),Step(text: "Fry Cheese"),Step(text: "Mix Cheese with Bacon"),Step(text: "Boil Water")]
        
        return steps
    }
}

