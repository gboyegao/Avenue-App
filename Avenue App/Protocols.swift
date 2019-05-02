//
//  protocols.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 16/02/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation
import UIKit

protocol CollectionViewDelegate:AnyObject {
    //MAKE GENERIC
    var trending:[Trending]{get}
    var popular:[Popular]{get}
    var discover:[Discover]{get}
    var articles:[Article]{get}
    
    func cellClicked(cell:UITableViewCell,name:String,imageURL:String)
}
protocol RecipeExpandable {
    var recipeName:String{get}
    var recipeImage:String{get}
}


protocol ProfileDetailDelegate {
    var firstName:String?{ get }
    var lastName:String?{ get }
}
