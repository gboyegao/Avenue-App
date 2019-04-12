//
//  Models.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 19/02/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation
import RealmSwift




struct Trending:RecipeExpandable{
    var recipeName:String
    var recipeImage:String
    var curatorImage:String
    var tags:[Tag]

    static func loadTrendingData() -> [Trending]{
        let trendingData = [
            Trending(recipeName: "American Cheese Burgers", recipeImage: "https://techcrunch.com/wp-content/uploads/2019/03/Team-Mobot.png", curatorImage: "curatorImage1", tags: [Tag(tagName:"breakfast"),Tag(tagName:"easyfix")]),
            Trending(recipeName: "Italian Steaks", recipeImage: "https://techcrunch.com/wp-content/uploads/2019/03/Team-Mobot.png", curatorImage: "curatorImage2", tags: [Tag(tagName:"lunch"),Tag(tagName:"fastmeal")]),
            Trending(recipeName: "Smoothie Shakes", recipeImage: "https://techcrunch.com/wp-content/uploads/2019/03/Team-Mobot.png", curatorImage: "curatorImage3", tags: [Tag(tagName:"dinner")]),
            Trending(recipeName: "American Breakfast", recipeImage: "https://techcrunch.com/wp-content/uploads/2019/03/Team-Mobot.png", curatorImage: "curatorImage4", tags: [Tag(tagName:"easyfix")]),
            Trending(recipeName: "Watermelon Splash", recipeImage: "https://techcrunch.com/wp-content/uploads/2019/03/Team-Mobot.png", curatorImage: "curatorImage5", tags: [Tag(tagName:"fastmeal")])
        ]
        
        return trendingData
    }
}

struct Popular:RecipeExpandable{
    var recipeName:String
    var recipeImage:String//URL
    var duration:String
    var curatorImage:String
    var favorites:String
    
    static func loadPopularData() -> [Popular]{
        let popularData = [
            Popular(recipeName: "Popular Image 1", recipeImage: "recipe4", duration: "10", curatorImage: "avatar", favorites: "11"),
            Popular(recipeName: "Popular Image 2", recipeImage: "recipe2", duration: "30", curatorImage: "avatar", favorites: "11"),
            Popular(recipeName: "Popular Image 3", recipeImage: "recipe3", duration: "60", curatorImage: "avatar", favorites: "11"),
            Popular(recipeName: "Popular Image 4", recipeImage: "recipe1", duration: "90", curatorImage: "avatar", favorites: "11")
        ]
        return popularData
    }
}

struct Discover{
    let curatorName:String
    let curatorImage:String
    
    static func loadDiscoverData() -> [Discover]{
        let discoverData = [
            Discover(curatorName: "Chef Chioma", curatorImage: "avatar1"),
            Discover(curatorName: "Anita Cooks", curatorImage: "avatar2"),
            Discover(curatorName: "Thelmzkitchen", curatorImage: "avatar3")
        ]
        
        return discoverData
    }
    
}




struct Following {
    let curatorName:String
    let curatorImage:String
    //TODO Curator UID
    
    static func loadFollowings() -> [Following]{
        let followings = [
            Following(curatorName: "Chef Gbemi", curatorImage: "avatar1"),
            Following(curatorName: "Chef Amaka", curatorImage: "avatar1"),
            Following(curatorName: "Chef Tiwa", curatorImage: "avatar1"),
            Following(curatorName: "Chef Anita", curatorImage: "avatar1")
        ]
        
        return followings
    }
}


