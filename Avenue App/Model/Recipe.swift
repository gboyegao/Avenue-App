//
//  Recipe.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 27/11/2018.
//  Copyright © 2018 Gboyega. All rights reserved.
//

import Foundation

struct Recipe {
//    var title:String
//    var tags:[Tags]?
//    var ingredients:[Ingredients]
//    var servings:Int
//    var time:Int
//    var curator:Int
//    var likes:Int
//    var steps:[Step]
//
//    Mutating func addLike
//    Mutating func removeLike
//    Mutating func addStep
//    Mutating func removeStep
}

struct Ingredient {
    var name:String
    var product:Product?
    
    init(name:String,product:Product? = nil) {
        self.name = name
        self.product = product
    }
}

struct Step {
    var text:String
    var imageURL:URL?
    
    init(text:String,imageURL:URL? = nil){
        self.text = text
        self.imageURL = imageURL
    }
}

