//
//  TodayPlannerTableViewCell.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 18/11/2018.
//  Copyright © 2018 Gboyega. All rights reserved.
//

import UIKit
import Firebase


protocol TodayPlannerTableViewDelegate {
    var popular:Popular{get}
    func popularCellClicked(_ atIndex:Int)
}

class TodayPlannerTableViewCell: UITableViewCell{
    
//    var docRef:DocumentReference!
    typealias Item = Int
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
        if let trending = delegate?.trending[indexPath.row]{
            cell.title.text = trending.recipeName
            cell.recipeImageView.image = UIImage(named: trending.recipeImage)
            
        }
        return cell
    }
}


extension TodayPlannerTableViewCell:UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.todayCell(indexPath.row)
    }
    
    
    
}
