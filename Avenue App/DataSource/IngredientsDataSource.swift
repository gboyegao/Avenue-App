//
//  IngredientsDataSource.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 22/02/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation

import UIKit


public class IngredientsDataSource: NSObject {
    let ingredients: [Ingredient]
    
    init(ingredients: [Ingredient]) {
        self.ingredients = ingredients
    }
    
    func ingredient(at indexPath: IndexPath) -> Ingredient {
        return self.ingredients[indexPath.row]
    }
}

extension IngredientsDataSource: UITableViewDataSource,UITableViewDelegate {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ingredients.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cell(for: ingredient(at: indexPath),tableView:tableView,indexPath: indexPath)
    }
    
    func cell(for ingredient: Ingredient,tableView: UITableView,indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = ingredient.quantity + "\t" + ingredient.name
        cell.backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.9607843137, blue: 0.9882352941, alpha: 1)
        cell.selectionStyle = .none
        return cell
    }
}
