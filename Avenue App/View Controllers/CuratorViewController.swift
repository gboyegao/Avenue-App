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
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var followButton: UIButton!
    var curatorName:String!
    var curatorImageURL:String!
    
    var curator:Curator!
    var recipes = [CuratorRecipe]()
    
    
    
    var currentDataSource:(UITableViewDelegate & UITableViewDataSource)?{
        didSet{
            recipeTableView.delegate = self
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
    
    override func viewDidLayoutSubviews() {
            curatorImageView.layer.cornerRadius = (view.frame.height * 0.18) / 2
            curatorImageView.layer.borderWidth = view.frame.height * 0.18 * 0.046
        followButton.translatesAutoresizingMaskIntoConstraints = false
        
            likesAndFollowingLabel.translatesAutoresizingMaskIntoConstraints = false
        curatorImageView.translatesAutoresizingMaskIntoConstraints = false
            likesAndFollowingLabel.topAnchor.constraint(equalTo: curatorNameLabel.bottomAnchor, constant: view.frame.height * 0.01).isActive = true
        
            followButton.topAnchor.constraint(equalTo: likesAndFollowingLabel.bottomAnchor, constant: view.frame.height * 0.018).isActive = true
        
        
            curatorImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: (view.frame.height * 0.018)).isActive = true
        
        
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

extension CuratorViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let recipe = recipes[indexPath.row]
            coordinator?.viewRecipe(recipeName: recipe.recipeName, recipeImage: recipe.recipeImage)
    }
}
