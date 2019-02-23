//
//  RecipeDetailViewController.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 17/02/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeInfoView: UIView!
    @IBOutlet weak var recipeTableView: UITableView!
    @IBOutlet weak var segmentedControl: SegmentedControl!
    
    private enum SourceType: Int {
        case directions, ingredients
    }

    var steps:[Step] = Step.loadSteps()
    var ingredients:[Ingredient] = Ingredient.loadIngredients()
    
    var recipeTitle:String!
    
    var currentDataSource:(UITableViewDelegate & UITableViewDataSource)?{
        didSet{
            recipeTableView.delegate = currentDataSource
            recipeTableView.dataSource = currentDataSource
            recipeTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        recipeTitleLabel.text = recipeTitle
        setUpTagLabels()
        segmentedControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            self.setDataSource(type:.directions)
        
    }
    
    
    //Abstract Class
    func setUpTagLabels(){
        // Map Trending Data Tags
        // ADD Subview
        var tagLabel = TagLabel(text: "Quick Fix")
        recipeInfoView.addSubview(tagLabel)
        
        tagLabel.leadingAnchor.constraint(equalTo: recipeInfoView.leadingAnchor,constant:20).isActive = true
        tagLabel.bottomAnchor.constraint(equalTo: recipeInfoView.bottomAnchor,constant:-20).isActive = true
        
    }
    
    @objc func segmentChanged(_ sender:UISegmentedControl){
        let type = SourceType(rawValue: sender.selectedSegmentIndex) ?? .directions
        self.setDataSource(type: type)

    }
    
    private func setDataSource(type:SourceType){
        switch type {
        case .directions:
            self.currentDataSource = DirectionsDataSource(steps: steps)
        case .ingredients:
            self.currentDataSource = IngredientsDataSource(ingredients: ingredients)
        default:
            break
        }
    }
    

    

}
