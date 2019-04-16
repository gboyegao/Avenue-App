//
//  ImageContentTableViewCell.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 15/04/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import UIKit

class ImageContentTableViewCell: UITableViewCell {
    @IBOutlet weak var imageContentView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpView(imageURL:String){
        guard let url = URL(string: imageURL) else { return }
        
        ImageService.getImage(withURL: url, completion: {
            image in
                self.imageContentView.image = image
        })
    }

}
