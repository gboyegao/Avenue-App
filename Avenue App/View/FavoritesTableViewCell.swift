//
//  IngredientsTableViewCell.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 22/02/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var favoriteRecipeName: UILabel!
    @IBOutlet weak var favoriteCuratorName: UILabel!
    @IBOutlet weak var favoriteRecipeTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(favorite:Favorite){
        favoriteRecipeName.text = favorite.recipeName
        favoriteCuratorName.text = favorite.curatorName
        favoriteRecipeTime.text =  "\(favorite.time) min"
    }

}
