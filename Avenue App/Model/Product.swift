//
//  Product.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 27/11/2018.
//  Copyright © 2018 Gboyega. All rights reserved.
//

import Foundation
import UIKit

struct Product{
    var name:String
    var price:Double
    var description:String
    var image:UIImage
    var tags:[Tag]?
    var reviews:[Review]?
    
    init(name:String,price:Double,description:String,image:UIImage){
        self.name = name
        self.price = price
        self.description = description
        self.image = image
        self.tags = nil
        self.reviews = nil
    }

    
    init(name:String,price:Double,description:String,image:UIImage,tags:[Tag]){
        self.name = name
        self.price = price
        self.description = description
        self.image = image
        self.tags = tags
        self.reviews = nil
    }
    init(name:String,price:Double,description:String,image:UIImage,reviews:[Review]){
        self.name = name
        self.price = price
        self.description = description
        self.image = image
        self.tags = nil
        self.reviews = reviews
    }
    init(name:String,price:Double,description:String,image:UIImage,tags:[Tag],reviews:[Review]){
        self.name = name
        self.price = price
        self.description = description
        self.image = image
        self.tags = tags
        self.reviews = reviews
    }

}



struct Review:Equatable{
    var rating:Int = 0
    //Test Rating cannot be above 5 or less than 0
    var description:String
    var reviewer:String
    
    
    init(rating:Int,description:String,reviewer:String) {
        if rating < 0 {self.rating = 0 }
        else if  rating > 5 {self.rating = 5}
        else{ self.rating = rating }
    
        
        self.description = description
        self.reviewer = reviewer
    }
    
    static func == (lhs:Review,rhs:Review) -> Bool{
        return lhs.reviewer == rhs.reviewer && lhs.description == rhs.description && lhs.rating == rhs.rating
    }

}



