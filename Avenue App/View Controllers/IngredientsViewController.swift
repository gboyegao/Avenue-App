//
//  IngredientsViewController.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 03/03/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import UIKit

class IngredientsViewController: UIViewController {
    var coordinator:MainCoordinator?
    
    @IBOutlet weak var ingredientsTableView: UITableView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var curatorNameLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    
    var ingredients:[Ingredient] = [Ingredient]()
    var recipeID:String!
    var shoppingItem:ShoppingItem?

    var currentDataSource:(UITableViewDelegate & UITableViewDataSource)?{
        didSet{
            ingredientsTableView.delegate = currentDataSource
            ingredientsTableView.dataSource = currentDataSource
            ingredientsTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load Shopping item for recipe id
        //SetUpView
        
        shoppingItem = ShoppingListController.loadItem(id: recipeID)
        
        //Load Shopping Ingredients using ingredients Data Source
        ingredients =  Array(shoppingItem!.ingredients).map({Ingredient(name: $0.name, quantity: $0.quantity)})
        
        currentDataSource =  IngredientsDataSource(ingredients: ingredients)
        
        setUpView(item: shoppingItem)

    }
    
    override func viewWillAppear(_ animated: Bool) {
     
        navigationController?.setNavigationBarHidden(true, animated: true)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
       
    }

    @IBAction func viewRecipePressed(_ sender: Any) {
        guard let item = shoppingItem else { return }
        
        coordinator?.viewRecipe(recipeName: item.recipeName, recipeImage: item.recipeImage)
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func setUpView(item:ShoppingItem?){
        if let item = item {
            recipeNameLabel.text = item.recipeName
            curatorNameLabel.text = item.curatorName
     }
    }
}

