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
    @IBOutlet weak var curatorNameLabel: UILabel!
    
    let favorites:[Favorite]? = [Favorite]()
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
     profileSegmentedControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        
        coordinator = MainCoordinator(navigationController: navigationController!)
        
        
        
    }
    override func viewDidLayoutSubviews() {
        profileImageView.layer.cornerRadius = (view.frame.height * 0.18) / 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
        curatorNameLabel.text = "\(UserDataController.loadFirstName()) \(UserDataController.loadLastName())"
        
            setDataSource(type: .favorites)
        
    }
    
    
    @objc func segmentChanged(_ sender:UISegmentedControl){
        let type = SourceType(rawValue: sender.selectedSegmentIndex) ?? .favorites
        self.setDataSource(type: type)
        
    }
    
    private func setDataSource(type:SourceType){
        switch type {
        case .favorites:
            let favoriteList = FavoriteController.loadFavorites()
            guard let favorites = favoriteList else{
                return
            }
            profileSegmentedControl.selectedSegmentIndex = 0
            self.currentDataSource = FavoritesDataSource(favorites: favorites)
            self.currentSourceType = .favorites
        case .followings:
            self.currentDataSource = FollowingsDataSource(followings: followings)
            self.currentSourceType = .followings
            profileSegmentedControl.selectedSegmentIndex = 1

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
        tableView.deselectRow(at: indexPath, animated: true)

        if currentSourceType == .followings {
            let selectedCurator = followings[indexPath.row]
        
            coordinator?.viewCurator(curatorName: selectedCurator.curatorName, curatorImage: selectedCurator.curatorImage)
            return
        }
        else {
            let favoriteList = FavoriteController.loadFavorites()
            guard let favorites = favoriteList else{
                return
            }
            let selectedRecipe = favorites[indexPath.row]
                        coordinator?.viewRecipe(recipeName: selectedRecipe.recipeName, recipeImage: selectedRecipe.recipeImage)
            return
            
        }

    }
    
    
}
