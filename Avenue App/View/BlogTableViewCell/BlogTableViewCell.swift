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
     weak var delegate:CollectionViewDelegate?
    
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
        return delegate!.articles.count
         
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let blogArticle = delegate?.articles[indexPath.row] else { return UICollectionViewCell() }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "blogSectionCell", for: indexPath as IndexPath) as! BlogCollectionViewCell
        
        cell.setUpView(article: blogArticle)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let blogArticle = delegate?.articles[indexPath.row] else { return }
        
        delegate?.cellClicked(cell: self, name: blogArticle.articleName, imageURL: blogArticle.articleImage)
        
    }
    
    
}
