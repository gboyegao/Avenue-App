//
//  ListTableViewController.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 17/11/2018.
//  Copyright © 2018 Gboyega. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 358;
        tableView.register(UINib(nibName: "TodayPlannerTableViewCell", bundle: nil), forCellReuseIdentifier: "todayPlannerTableViewCell")
         tableView.register(UINib(nibName: "PopularTableViewCell", bundle: nil), forCellReuseIdentifier: "popularTableViewCell")
        tableView.register(UINib(nibName: "DiscoverTableViewCell", bundle: nil), forCellReuseIdentifier: "discoverTableViewCell")
        tableView.register(UINib(nibName: "BlogTableViewCell", bundle: nil), forCellReuseIdentifier: "blogTableViewCell")

        //        self.tableView.register(TodayPlannerTableViewCell, forCellReuseIdentifier: "todayPlannerTableViewCell")
//
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        var heights:[CGFloat] = [358,213,128,237]
        
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
        let popularCell = tableView.dequeueReusableCell(withIdentifier: "popularTableViewCell") as!  PopularTableViewCell

        let discoverCell = tableView.dequeueReusableCell(withIdentifier: "discoverTableViewCell") as!  DiscoverTableViewCell
        let blogCell = tableView.dequeueReusableCell(withIdentifier: "blogTableViewCell") as!  BlogTableViewCell
        let cells: [UITableViewCell] = [todayCell,popularCell,discoverCell,blogCell]
//
        // Configure the cell...
        cells[indexPath.row].selectionStyle = UITableViewCellSelectionStyle.none
        return cells[indexPath.row]
    }
    


}
