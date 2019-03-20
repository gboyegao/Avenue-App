//
//  protocols.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 16/02/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation


protocol CollectionViewDelegate:AnyObject {
    //MAKE GENERIC
    var trending:[Trending]{get}
    var popular:[Popular]{get}
    var discover:[Discover]{get}
    
    func cellClicked(_ atIndex:Any)
}


protocol RecipeExpandable {
    var recipeName:String{get}
    var recipeImage:String{get}
    //IMAGE URL
    //UUID
}
