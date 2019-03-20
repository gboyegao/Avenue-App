//
//  HomeViewController.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 15/11/2018.
//  Copyright © 2018 Gboyega. All rights reserved.
//

import UIKit
import Firebase


class HomeViewController: UITableViewController,CollectionViewDelegate{
    
    var docRef:DocumentReference!
    
    
    var trending:[Trending] = Trending.loadTrendingData()
    var popular: [Popular] = Popular.loadPopularData()
    var discover: [Discover] = Discover.loadDiscoverData()
    
    var coordinator:MainCoordinator?
    
    func cellClicked(_ atIndex: Any) {
        print(atIndex)
        switch atIndex {
            case let atIndex as Trending:
                coordinator?.viewRecipe(recipe: atIndex)
            case let atIndex as Popular:
                coordinator?.viewRecipe(recipe: atIndex)
            case let atIndex as Discover:
                coordinator?.viewCurator()
        default:
            print("Type not supported")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
          navigationController?.setNavigationBarHidden(false, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coordinator = MainCoordinator(navigationController: navigationController!)
        
//        docRef = Firestore.firestore().document("trending/recipes")
//        docRef.getDocument(completion: {
//            (docSnapshot,error) in
//            if error != nil{
//                print(error!.localizedDescription)
//            }
//            if let myData = docSnapshot?.data(){
//                let name = myData["name"] as? [Trending] ?? [Trending]()
//                self.trending = name
//
//            }
//            //Add Dispatch to Main Thread to reload Table View Data
//            //Hide Activity Loading Data 
//            
//            
//
//        })
        
        
     
        tableView.register(UINib(nibName: "TodayPlannerTableViewCell", bundle: nil), forCellReuseIdentifier: "todayPlannerTableViewCell")
        tableView.register(UINib(nibName: "PopularTableViewCell", bundle: nil), forCellReuseIdentifier: "popularTableViewCell")
        tableView.register(UINib(nibName: "DiscoverTableViewCell", bundle: nil), forCellReuseIdentifier: "discoverTableViewCell")
        tableView.register(UINib(nibName: "BlogTableViewCell", bundle: nil), forCellReuseIdentifier: "blogTableViewCell")
        
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        var heights:[CGFloat] = [280,213,128,237,283]
        
        return heights[indexPath.row];
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let todayCell = tableView.dequeueReusableCell(withIdentifier: "todayPlannerTableViewCell", for: indexPath) as! TodayPlannerTableViewCell
        let todayCell = tableView.dequeueReusableCell(withIdentifier: "todayPlannerTableViewCell") as! TodayPlannerTableViewCell
            todayCell.delegate = self
        
        let popularCell = tableView.dequeueReusableCell(withIdentifier: "popularTableViewCell") as!  PopularTableViewCell
            popularCell.delegate = self
        
        let discoverCell = tableView.dequeueReusableCell(withIdentifier: "discoverTableViewCell") as!  DiscoverTableViewCell
            discoverCell.delegate = self
        let blogCell = tableView.dequeueReusableCell(withIdentifier: "blogTableViewCell") as!  BlogTableViewCell
        let cells: [UITableViewCell] = [todayCell,popularCell,discoverCell,blogCell]
        //
        // Configure the cell...
        cells[indexPath.row].selectionStyle = UITableViewCell.SelectionStyle.none
        return cells[indexPath.row]
    }
    
    @IBAction func unwindToHome(segue:UIStoryboardSegue) {
        
    }
}
