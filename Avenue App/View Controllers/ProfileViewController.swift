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
    var steps:[Step] = Step.loadSteps()
    var ingredients:[Ingredient] = Ingredient.loadIngredients()
    
    var currentDataSource:(UITableViewDelegate & UITableViewDataSource)?{
        didSet{
            profileTableView.delegate = currentDataSource
            profileTableView.dataSource = currentDataSource
            profileTableView.reloadData()
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
//        profileImageView.layer.cornerRadius = profileImageView.constraints.heigh / 2        // Do any additional setup after loading the view.
     profileSegmentedControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        setDataSource(type: .favorites)

    }
    
    
    @objc func segmentChanged(_ sender:UISegmentedControl){
        let type = SourceType(rawValue: sender.selectedSegmentIndex) ?? .favorites
        self.setDataSource(type: type)
        
    }
    
    private func setDataSource(type:SourceType){
        switch type {
        case .favorites:
            self.currentDataSource = FavoritesDataSource(favorites: favorites)
        case .followings:
            self.currentDataSource = FollowingsDataSource(followings: followings)
        }
    }

    
}
