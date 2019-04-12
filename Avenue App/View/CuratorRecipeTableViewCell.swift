//
//  CuratorRecipeTableViewCell.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 09/04/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import UIKit

class CuratorRecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeImageView: RoundedImageView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipeTagsLabel: UILabel!
    @IBOutlet weak var favoritesCountLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(_ curatorRecipe:CuratorRecipe){
        recipeNameLabel.text = curatorRecipe.recipeName
        let tags = curatorRecipe.tags.joined(separator: ",")
        recipeTagsLabel.text = "Tags: \(tags)"
        
        favoritesCountLabel.text = "\(curatorRecipe.favoriteCount) Likes"
        timeLabel.text = "\(curatorRecipe.time) Mins"
        
        
    }

}
