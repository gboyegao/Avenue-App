//
//  CuratorViewController.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 06/03/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import UIKit

class CuratorViewController: UIViewController {
    var coordinator:MainCoordinator?
    @IBOutlet weak var curatorImageView: CircularImageView!
    @IBOutlet weak var curatorNameLabel: UILabel!
    @IBOutlet weak var likesAndFollowingLabel: UILabel!
    @IBOutlet weak var curatorBanner: UIImageView!
    @IBOutlet weak var recipeTableView: UITableView!
    
    var curatorName:String!
    var curatorImageURL:String!
    
    var curator:Curator!
    var recipes = [CuratorRecipe]()
    
    
    
    var currentDataSource:(UITableViewDelegate & UITableViewDataSource)?{
        didSet{
            recipeTableView.delegate = currentDataSource
            recipeTableView.dataSource = currentDataSource
            recipeTableView.reloadData()
        }
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentDataSource = CuratorRecipeDataSource(curatorRecipes: recipes)
        // Do any additional setup after loading the view.
        recipeTableView.rowHeight = 100
        
        curatorNameLabel.text = curatorName
        
        
        NetworkController.getCurator(id: "9UYRGiPOy9BYkLb8olNf", completion: {
            curator in
             self.setUpVC(curator: curator)
        })
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }

    func setUpVC(curator:Curator){
        likesAndFollowingLabel.text = "\(curator.favoriteCount) Likes   \(curator.followingCount) Following"
        recipes = curator.recipes
        currentDataSource = CuratorRecipeDataSource(curatorRecipes: recipes)
    }
    
    
    
}
