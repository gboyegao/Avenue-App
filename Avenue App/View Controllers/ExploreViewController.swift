//
//  ExploreViewController.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 25/02/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import UIKit
import InstantSearch

class ExploreViewController: HitsTableViewController {
    var coordinator:MainCoordinator?
    
    @IBOutlet weak var searchBar: SearchBarWidget!
    
    @IBOutlet weak var tableview: HitsTableWidget!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        InstantSearch.shared.registerAllWidgets(in: self.view)
        hitsTableView = tableview
        coordinator = MainCoordinator(navigationController: navigationController!)
        
        searchBar.delegate = self

    }
    
 
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, containing hit: [String : Any]) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exploreCell", for: indexPath) as! ExploreTableViewCell
        
        cell.recipeNameLabel?.text = hit["name"] as? String
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath, containing hit: [String: Any])  {
        
    }

}


extension ExploreViewController:UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}
