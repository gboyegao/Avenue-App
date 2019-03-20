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
        docRef.document("recipe/ZbDBusdqU3dL1iNwaGZl").getDocument(completion: {
            (document,error) in
            if error != nil{
                print(error!.localizedDescription)
            }
            
            if let document = document,document.exists,let myData = document.data(){
                
                let recipeName = myData["recipeName"] as? String ?? ""
                var recipe = Recipe(recipeName: "Pancakes", recipeImage: "image1", curatorImage: "avatar", tags: [Tag(tagName:"Quick Fix")], steps: [Step(text: "")], ingredients: Ingredient.loadIngredients(), servings: 30, time: 30, curatorID: 100, favoriteCount: 10)
                recipe.recipeName = recipeName
                
                
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
    static func getCurator(uuid:UUID,completion: @escaping (Recipe) -> Void){
        
    }
}
