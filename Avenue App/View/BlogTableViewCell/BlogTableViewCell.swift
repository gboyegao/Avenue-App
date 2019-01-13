//
//  BlogTableViewCell.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 22/11/2018.
//  Copyright © 2018 Gboyega. All rights reserved.
//

import UIKit

class BlogTableViewCell: UITableViewCell {

    @IBOutlet weak var blogCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        blogCollectionView.dataSource = self
        blogCollectionView.delegate = self
        blogCollectionView.register(UINib.init(nibName: "BlogCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "blogSectionCell")
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
//TO-DO: INTEGRATE DATA SOURCE TO ONE SOURCE
extension BlogTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
         
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "blogSectionCell", for: indexPath as IndexPath) as! BlogCollectionViewCell
        
        return cell
    }
    
    
}
