//
//  PopularCollectionViewCell.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 19/11/2018.
//  Copyright © 2018 Gboyega. All rights reserved.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipeTimeLabel: UILabel!
    @IBOutlet weak var recipeLikesLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func update(_ popular:Popular){
        recipeNameLabel.text = popular.recipeName
        recipeTimeLabel.text = "\(popular.duration)"
        recipeImageView.image = UIImage(named: popular.recipeImage)
        
    }

}
