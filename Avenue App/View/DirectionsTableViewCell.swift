//
//  EmojiTableViewCell.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 22/02/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import UIKit

class DirectionsTableViewCell: UITableViewCell {
    @IBOutlet weak var directionLabel: UILabel!
    
    @IBOutlet weak var directionNumber: UILabel!
    
    @IBOutlet weak var directionImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with direction:Step, stepNumber:Int){
        directionLabel.text = direction.text
        directionNumber.text = "\(stepNumber)"
    }
    
    
}
