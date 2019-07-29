//
//  PopularTableViewCell.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 18/11/2018.
//  Copyright © 2018 Gboyega. All rights reserved.
//

import UIKit

class PopularTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    weak var delegate:CollectionViewDelegate?
    var popular:[Popular]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        popularCollectionView.register(UINib.init(nibName: "PopularCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "popularSectionCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateCell(){
        
    }
    
    
}

extension PopularTableViewCell:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popular.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularSectionCell", for: indexPath as  IndexPath) as! PopularCollectionViewCell

                cell.update(popular[indexPath.row])
        
        return cell
    }
}


extension PopularTableViewCell:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let popularRecipe = popular[indexPath.row]
        
        delegate?.cellClicked(cell:self,name: popularRecipe.recipeName,imageURL: popularRecipe.recipeImage)
    }
    
}
