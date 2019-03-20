//
//  FollowingTableViewCell.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 22/02/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import UIKit

class FollowingTableViewCell: UITableViewCell {

    @IBOutlet weak var curatorImageView: CircularImageView!
    @IBOutlet weak var curatorNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(following:Following){
        curatorNameLabel.text = following.curatorName
    }

}
