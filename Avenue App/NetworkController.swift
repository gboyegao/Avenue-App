//
//  NetworkController.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 13/03/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation
import Firebase


class NetworkController{
    static var docRef = Firestore.firestore()
    
    static func getRecipe(completion: @escaping (Recipe) -> Void){
        //Add Document id
        docRef.document("recipe/ZbDBusdqU3dL1iNwaGZl").getDocument(completion: {
            (document,error) in
            if error != nil{
                print(error!.localizedDescription)
            }
            
            if let document = document,document.exists,let myData = document.data(){
                
                let recipeName = myData["recipeName"] as? String ?? ""
                let recipeServings = myData["servings"] as? Int ?? 1
                let recipeTime = myData["time"] as? Int ?? 1
                let recipeTags = myData["tags"] as? [String] ?? []
                let recipeStepsArray = myData["steps"] as? [[String:String]] ?? []
                let recipeIngredientsArray = myData["ingredients"] as? [[String:String]] ?? []
                let recipeCurator = myData["curatorImage"] as? String ?? ""
                
                
                var recipeSteps = [Step]()
                var recipeIngredients = [Ingredient]()
                
                for step in recipeStepsArray{
                    guard let stepText = step["text"] else { return }
                    
                    guard let stepImageURL = step["imageURL"] else { recipeSteps.append(Step(text: stepText))
                        return
                    }
                    
                    recipeSteps.append(Step(text: stepText, imageURL: stepImageURL))
                }
                
                for ingredient in recipeIngredientsArray{
                    guard let name = ingredient["name"],let quantity = ingredient["quantity"]  else { return }
                    
                    recipeIngredients.append(Ingredient(name: name, quantity: quantity))
                }
                
               
                
                var recipe = Recipe(recipeName: "Pancakes", recipeImage: "image1", curatorImage: "avatar", tags: ["Quick Fix"], steps: [Step(text: "")], ingredients: Ingredient.loadIngredients(), servings: 30, time: 30, curatorID: 100, favoriteCount: 10)
                recipe.recipeName = recipeName
                recipe.servings = recipeServings
                recipe.time = recipeTime
                recipe.tags = recipeTags
                recipe.steps = recipeSteps
                recipe.ingredients = recipeIngredients
                recipe.curatorImage = recipeCurator
                
                
                print(recipeSteps)
                completion(recipe)
                //self.recipeTitleLabel.text = recipeName
                
            }
            else{
                print("Document does not exist")
            }
            
        })

        
    }
 
    static func getBlogPost(uuid:UUID,completion: @escaping (Recipe) -> Void){
        
        
    }
    static func getCurator(id:String,completion: @escaping (Curator) -> Void){
        
        docRef.document("curator/\(id)").getDocument(completion: {
            (document,error) in
            if error != nil{
                print(error!.localizedDescription)
            }
            
            if let document = document,document.exists,let myData = document.data(){
                
                let name = myData["name"] as? String ?? ""
                let favoriteCount = myData["favoriteCount"] as? Int ?? 1
                let followingCount = myData["followingCount"] as? Int ?? 1
                let recipesArray = myData["recipes"] as? [[String:Any]] ?? []
                
                var curatorRecipes = [CuratorRecipe]()
                
                
                for recipe in recipesArray{
                    guard let recipeName = recipe["recipeName"] as? String, let recipeID = recipe["recipeID"] as? String, let recipeImage = recipe["recipeImage"] as? String, let recipeTags = recipe["tags"] as? [String], let time = recipe["time"] as? Int, let favoriteCount = recipe["favoriteCount"] as? Int  else { return }
                    
                    
                    let curatorRecipe = CuratorRecipe(recipeID:recipeID,recipeName:recipeName,tags:recipeTags,favoriteCount:favoriteCount,time:time,recipeImage:recipeImage)
                    
                    curatorRecipes.append(curatorRecipe)
                }
                
                let curator = Curator(curatorID: id, name:name,favoriteCount:favoriteCount,followingCount:followingCount,recipes:curatorRecipes)
                
                print(curatorRecipes)
                completion(curator)
                
            }
            else{
                print("Document does not exist")
            }
            
        })
        
    }
}
