//
//  CuratorRecipeDataSource.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 09/04/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation
import UIKit

public class CuratorRecipeDataSource: NSObject {
    
    var curatorRecipes: [CuratorRecipe]
    
    init(curatorRecipes: [CuratorRecipe]) {
        self.curatorRecipes = curatorRecipes
    }
    
    func curatorRecipe(at indexPath: IndexPath) -> CuratorRecipe {
        return self.curatorRecipes[indexPath.row]
    }
}

extension CuratorRecipeDataSource: UITableViewDataSource,UITableViewDelegate {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.curatorRecipes.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cell(for: curatorRecipe(at: indexPath),tableView:tableView,indexPath: indexPath)
    }
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            curatorRecipes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func cell(for curatorRecipe: CuratorRecipe,tableView: UITableView,indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "curatorRecipeCell") as! CuratorRecipeTableViewCell
        cell.update(curatorRecipe)
        return cell
    }
}

