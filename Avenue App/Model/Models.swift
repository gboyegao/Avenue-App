//
//  Models.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 19/02/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation



struct Trending{
    var recipeName:String
    var recipeImage:String
    var curatorImage:String
    var tags:[Tag]

    static func loadTrendingData() -> [Trending]{
        let trendingData = [
            Trending(recipeName: "American Cheese Burgers", recipeImage: "recipe1", curatorImage: "curatorImage1", tags: [Tag(tagName:"breakfast"),Tag(tagName:"easyfix")]),
            Trending(recipeName: "Italian Stakes", recipeImage: "recipe2", curatorImage: "curatorImage2", tags: [Tag(tagName:"lunch"),Tag(tagName:"fastmeal")]),
            Trending(recipeName: "Smoothie Shakes", recipeImage: "recipe5", curatorImage: "curatorImage3", tags: [Tag(tagName:"dinner")]),
            Trending(recipeName: "American Breakfast", recipeImage: "recipe4", curatorImage: "curatorImage4", tags: [Tag(tagName:"easyfix")]),
            Trending(recipeName: "Watermelon Splash", recipeImage: "recipe3", curatorImage: "curatorImage5", tags: [Tag(tagName:"fastmeal")])
        ]
        
        return trendingData
    }
}

struct Popular{
    var recipeName:String
    var recipeImage:String
    var duration:String
    var curatorImage:String
    var favorites:String
    
    static func loadPopularData() -> [Popular]{
        let popularData = [
            Popular(recipeName: "Popular Image 1", recipeImage: "Burgers", duration: "20", curatorImage: "avatar", favorites: "11"),
            Popular(recipeName: "Popular Image 2", recipeImage: "Burgers", duration: "20", curatorImage: "avatar", favorites: "11"),
            Popular(recipeName: "Popular Image 3", recipeImage: "Burgers", duration: "20", curatorImage: "avatar", favorites: "11"),
            Popular(recipeName: "Popular Image 4", recipeImage: "Burgers", duration: "20", curatorImage: "avatar", favorites: "11")
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

struct Favorite{
    let recipeImage:String
    let recipeName:String
    let curatorName:String
    let time:String
    //TODO: recipeuid
    
    
    static func loadFavorites() -> [Favorite]{
        let favorites = [
            Favorite(recipeImage: "avatar", recipeName: "Chicken Shawarma", curatorName: "Chef Fregz", time: "10"),
            Favorite(recipeImage: "avatar", recipeName: "Rice and Peas", curatorName: "Chef Fregz", time: "10"),
            Favorite(recipeImage: "avatar", recipeName: "Cheese and Fries", curatorName: "Chef Fregz", time: "10")
        ]
        
        return favorites
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


