//
//  TodayPlannerTableViewCell.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 18/11/2018.
//  Copyright © 2018 Gboyega. All rights reserved.
//

import UIKit
import Firebase


class TodayPlannerTableViewCell: UITableViewCell{
    
//    var docRef:DocumentReference!
    weak var delegate:CollectionViewDelegate?

    @IBOutlet weak var todayCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.todayCollectionView.delegate = self
        self.todayCollectionView.dataSource = self
        self.todayCollectionView.register(UINib.init(nibName: "TodayPlannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "todaySectionCell")
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}


extension TodayPlannerTableViewCell:UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate!.trending.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "todaySectionCell", for: indexPath as  IndexPath) as! TodayPlannerCollectionViewCell
//          cell.title.text = delegate?.trending[0].recipeName ?? ""
        if indexPath.row == 0 {
            cell.trendingLabel.text = "Trending"
        }
        else{
            cell.trendingLabel.text = ""
        }
        
        if let trending = delegate?.trending[indexPath.row]{
            cell.title.text = trending.recipeName
            let imageURL = URL(string: "https://firebasestorage.googleapis.com/v0/b/avenue-79575.appspot.com/o/chicken-burger.png?alt=media&token=2b8e79e8-2e5f-4133-b42d-b37e2a1a0c90")!
            
            ImageService.getImage(withURL: imageURL){
                image in
                cell.recipeImageView.image = image
                
            }
            
          //  cell.recipeImageView.image = UIImage(named: trending.recipeImage)
            
        }
        return cell
    }
}


extension TodayPlannerTableViewCell:UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let  trendingRecipe = delegate?.trending[indexPath.row]
        delegate?.cellClicked(trendingRecipe)
    }
    
    
    
}
