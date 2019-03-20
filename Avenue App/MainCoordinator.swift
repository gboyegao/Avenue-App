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
    
    func viewCurator(){
        let vc = CuratorViewController.instantiate(storyboardName: "Home") as! CuratorViewController
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func viewRecipe(recipe:RecipeExpandable){
        let vc = RecipeDetailViewController.instantiate(storyboardName: "Home") as! RecipeDetailViewController
        vc.coordinator = self
        vc.recipe = recipe
        navigationController.pushViewController(vc, animated: true)
    }
    
    
    
    func viewBlog(){
        
    }
    
    func viewShoppingIngredients(){
        let vc = IngredientsViewController.instantiate(storyboardName: "List") as! IngredientsViewController
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)

    }
    
    
    
}
