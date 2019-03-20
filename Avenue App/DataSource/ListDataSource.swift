//
//  ShoppingItemDataSource.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 24/02/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation
import UIKit

public class ListDataSource: NSObject {
    
    var lists: [ShoppingItem]
    
    init(lists: [ShoppingItem]) {
        self.lists = lists
    }
    
    func list(at indexPath: IndexPath) -> ShoppingItem {
        return self.lists[indexPath.row]
    }
}

extension ListDataSource: UITableViewDataSource,UITableViewDelegate {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lists.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cell(for: list(at: indexPath),tableView:tableView,indexPath: indexPath)
    }
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            lists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func cell(for list: ShoppingItem,tableView: UITableView,indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell") as! ListTableViewCell
        cell.update(list)
        return cell
    }
}
