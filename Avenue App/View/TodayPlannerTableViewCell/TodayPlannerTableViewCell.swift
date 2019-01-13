//
//  TodayPlannerTableViewCell.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 18/11/2018.
//  Copyright © 2018 Gboyega. All rights reserved.
//

import UIKit

class TodayPlannerTableViewCell: UITableViewCell {

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


extension TodayPlannerTableViewCell:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "todaySectionCell", for: indexPath as  IndexPath) as! TodayPlannerCollectionViewCell
        
        return cell
    }
    
    
}
