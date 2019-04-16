//
//  BlogCollectionViewCell.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 22/11/2018.
//  Copyright © 2018 Gboyega. All rights reserved.
//

import UIKit

class BlogCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var articleNameLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setUpView(article:Article){
        articleNameLabel.text = article.articleName
        guard let imageURL = URL(string: article.articleImage) else { return }
        
        ImageService.getImage(withURL: imageURL, completion: {
            image in
            self.articleImageView.image = image
            
        })
    }
    

}
