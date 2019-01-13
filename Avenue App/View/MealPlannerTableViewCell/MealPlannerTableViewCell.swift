//
//  MealPlannerTableViewCell.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 25/11/2018.
//  Copyright © 2018 Gboyega. All rights reserved.
//

import UIKit

class MealPlannerTableViewCell: UITableViewCell {

    @IBOutlet weak var mealPlannerCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.mealPlannerCollectionView.delegate = self
        self.mealPlannerCollectionView.dataSource = self
        self.mealPlannerCollectionView.register(UINib.init(nibName: "MealPlannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "mealPlannerSectionCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MealPlannerTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mealPlannerSectionCell", for: indexPath as  IndexPath) as! MealPlannerCollectionViewCell
        
        return cell
    }
    
    
}
