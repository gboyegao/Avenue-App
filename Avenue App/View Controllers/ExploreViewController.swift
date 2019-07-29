//
//  ExploreViewController.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 25/02/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import UIKit
import InstantSearch
import Firebase

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
        
        cell.recipeNameLabel?.text = hit["recipeName"] as? String
        cell.curatorNameLabel?.text = hit["curatorName"] as? String
        
        let time = hit["time"] as? Int
        
        cell.timeLabel?.text = (time != nil) ? "\(time!) mins":""
        
        guard let imageURLString = hit["recipeImage"] as? String, let url = URL(string: imageURLString) else {
            //Set Image as default image
            return cell
        }
        ImageService.getImage(withURL: url, completion: { image in
            cell.recipeImageView?.image = image
        })
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath, containing hit: [String: Any])  {
        
        guard let recipeName = hit["recipeName"] as? String, let recipeImage = hit["recipeImage"] as? String else{
            return
        }
        coordinator?.viewRecipe(recipeName: recipeName, recipeImage: recipeImage)
        
        tableView.deselectRow(at: indexPath, animated: true)

        
    }

}


extension ExploreViewController:UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        
        guard let searchText = searchBar.text else { return }
        
        Analytics.logEvent(AnalyticsEventSearch, parameters: [
            AnalyticsParameterSearchTerm:searchText
            ])

    }
}
