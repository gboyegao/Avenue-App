//
//  ProfileViewController.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 18/02/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileTableView: UITableView!
    @IBOutlet weak var profileSegmentedControl: SegmentedControl!
    @IBOutlet weak var profileImageView: CircularImageView!
    
    let favorites = Favorite.loadFavorites()
    let followings = Following.loadFollowings()
    
    private enum SourceType: Int {
        case favorites, followings
    }
    
    private var currentSourceType:SourceType = .favorites
    
    var steps:[Step] = Step.loadSteps()
    var ingredients:[Ingredient] = Ingredient.loadIngredients()
    
    
    var coordinator:MainCoordinator?
    
    var currentDataSource:(UITableViewDataSource)?{
        didSet{
            profileTableView.delegate = self
            profileTableView.dataSource = currentDataSource
            profileTableView.reloadData()
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
//        profileImageView.layer.cornerRadius = profileImageView.constraints.heigh / 2        // Do any additional setup after loading the view.
     profileSegmentedControl.backgroundColor = .white
     profileSegmentedControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        setDataSource(type: .favorites)
        
        coordinator = MainCoordinator(navigationController: navigationController!)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    @objc func segmentChanged(_ sender:UISegmentedControl){
        let type = SourceType(rawValue: sender.selectedSegmentIndex) ?? .favorites
        self.setDataSource(type: type)
        
    }
    
    private func setDataSource(type:SourceType){
        switch type {
        case .favorites:
            self.currentDataSource = FavoritesDataSource(favorites: favorites)
            self.currentSourceType = .favorites
        case .followings:
            self.currentDataSource = FollowingsDataSource(followings: followings)
            self.currentSourceType = .followings
        }
    }
}


extension ProfileViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if currentSourceType == .followings {
            return 70.0
        }
        else {
            return 100.0

        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if currentSourceType == .followings {
            let selectedCurator = followings[indexPath.row]
            tableView.deselectRow(at: indexPath, animated: true)
            coordinator?.viewCurator(curatorName: selectedCurator.curatorName, curatorImage: selectedCurator.curatorImage)
            return
        }
        else {
            let selectedRecipe = favorites[indexPath.row]
            tableView.deselectRow(at: indexPath, animated: true)
            coordinator?.viewRecipe(recipeName: selectedRecipe.recipeName, recipeImage: selectedRecipe.recipeImage)
            return
            
        }

    }
    
    
}
