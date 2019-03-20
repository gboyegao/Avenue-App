//
//  ListTableViewCell.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 24/02/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var curatorNameLabel: UILabel!
    @IBOutlet weak var recipeTimeLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(_ list:ShoppingItem){
        recipeNameLabel.text = list.recipeName
        curatorNameLabel.text = list.curatorName
        recipeTimeLabel.text = "\(list.time) min"
    }

}
