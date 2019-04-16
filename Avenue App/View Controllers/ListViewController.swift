//
//  ListViewController.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 18/02/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import UIKit


class ListViewController: UIViewController {
    
    
    @IBOutlet weak var listTableView: UITableView!
    
    
    var itemList:[ShoppingItem]? = [ShoppingItem]()
    var coordinator:MainCoordinator?
    
    var currentDataSource:(UITableViewDelegate & UITableViewDataSource)?{
        didSet{
            listTableView.delegate = self
            listTableView.dataSource = currentDataSource
            listTableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            coordinator = MainCoordinator(navigationController: navigationController!)
//            navigationItem.rightBarButtonItem = editButtonItem
        }
    
    override func viewWillAppear(_ animated: Bool) {
        itemList = ShoppingListController.loadItems()
        guard let list = itemList else {
            print("NO ITEMS ")
            return
            
        } //Can use special UI for case where list is empty
        currentDataSource = ListDataSource(lists:list)
        
         navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    
    @IBAction func editButtonTapped(_ sender: Any) {
        let tableViewIsEditing = listTableView.isEditing
        
        listTableView.setEditing(!tableViewIsEditing, animated: true)
    }
    
    
    
}


extension ListViewController:UITableViewDelegate{
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let itemList = itemList else { return }
        
        coordinator?.viewShoppingIngredients(id:itemList[indexPath.row].recipeID)
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    
}
