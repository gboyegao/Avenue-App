//
//  DiscoverTableViewCell.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 22/11/2018.
//  Copyright © 2018 Gboyega. All rights reserved.
//

import UIKit

class DiscoverTableViewCell: UITableViewCell {

    var delegate:CollectionViewDelegate?
    var discover:[Discover]!
    
    @IBOutlet weak var discoverCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        discoverCollectionView.delegate = self
        discoverCollectionView.dataSource = self
        discoverCollectionView.register(UINib.init(nibName: "DiscoverCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "discoverSectionCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension DiscoverTableViewCell:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return discover.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "discoverSectionCell", for: indexPath as IndexPath) as! DiscoverCollectionViewCell
        
        return cell
    }
    
    
}


extension DiscoverTableViewCell:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let  discoverRecipe = discover[indexPath.row]
        
            delegate?.cellClicked(cell: self, name: discoverRecipe.curatorName, imageURL: discoverRecipe.curatorImage)

    }
}
