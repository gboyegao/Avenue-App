//
//  MainCoordinator.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 06/03/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator:Coordinator{
    var navigationController: UINavigationController
    
    var childCoordinators = [Coordinator]()
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
    
    func viewCurator(curatorName:String,curatorImage:String){
        let vc = CuratorViewController.instantiate(storyboardName: "Home") as! CuratorViewController
        vc.coordinator = self
        vc.curatorName = curatorName
        vc.curatorImageURL = curatorImage
        navigationController.pushViewController(vc, animated: true)
    }
    
    func viewRecipe(recipeName:String,recipeImage:String){
        let vc = RecipeDetailViewController.instantiate(storyboardName: "Home") as! RecipeDetailViewController
        vc.coordinator = self
        vc.recipeName = recipeName
        vc.recipeImage = recipeImage
        navigationController.pushViewController(vc, animated: true)
    }
    
    func viewRecipeSlide(steps:[Step],indexPath:IndexPath){
        let vc = RecipeSlideViewController.instantiate(storyboardName: "Home") as! RecipeSlideViewController
        vc.coordinator = self
        vc.steps = steps
        vc.currentSlide = indexPath.row
        navigationController.pushViewController(vc, animated: true)
        
    }
    
    func viewBlogArticle(articleName:String,articleImage:String){
        let vc = BlogDetailViewController.instantiate(storyboardName: "Home") as! BlogDetailViewController
        vc.coordinator = self
        vc.articleName = articleName
        vc.imageURL = articleImage
        
        navigationController.pushViewController(vc, animated: true)
        
    }
    
    func viewShoppingIngredients(id:String){
        let vc = IngredientsViewController.instantiate(storyboardName: "List") as! IngredientsViewController
        vc.coordinator = self
        vc.recipeID = id
        navigationController.pushViewController(vc, animated: true)   
        
    }
    
    
    
}
