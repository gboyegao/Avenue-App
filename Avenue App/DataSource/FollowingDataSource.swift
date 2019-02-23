//
//  FollowingDataSource.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 22/02/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation
import UIKit


public class FollowingsDataSource: NSObject {
    let followings: [Following]
    
    init(followings: [Following]) {
        self.followings = followings
    }
    
    func following(at indexPath: IndexPath) -> Following {
        return self.followings[indexPath.row]
    }
}

extension FollowingsDataSource: UITableViewDataSource,UITableViewDelegate {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.followings.count
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cell(for: following(at: indexPath),tableView:tableView,indexPath: indexPath)
    }
    
    func cell(for following: Following,tableView: UITableView,indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "followingCell") as! FollowingTableViewCell
        cell.update(following: following)
        return cell
    }
}
