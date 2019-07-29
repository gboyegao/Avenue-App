//
//  HomeViewController.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 15/11/2018.
//  Copyright © 2018 Gboyega. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications


class HomeViewController: UITableViewController,CollectionViewDelegate{
    
    var docRef:DocumentReference!
    
    var window:UIWindow?
    
    
    var screen: Screen!
    
    var trending:[Trending] = Trending.loadTrendingData()
    var popular: [Popular] = Popular.loadPopularData()
    var discover: [Discover] = Discover.loadDiscoverData()
    var articles: [Article] = Article.loadArticleData()
    
    var coordinator:MainCoordinator?
    
    func cellClicked(cell:UITableViewCell,name:String,imageURL:String) {
        switch cell {
            case _ as PopularTableViewCell:
                coordinator?.viewRecipe(recipeName: name, recipeImage:imageURL)
            case _ as TodayPlannerTableViewCell:
                coordinator?.viewRecipe(recipeName: name, recipeImage:imageURL)
            case _ as DiscoverTableViewCell:
                coordinator?.viewCurator(curatorName: name,curatorImage:imageURL)
            case _ as BlogTableViewCell:
                coordinator?.viewBlogArticle(articleName: name, articleImage: imageURL)
                print("")
            default:
                print("Type not supported")
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
          navigationController?.setNavigationBarHidden(false, animated: true)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://localhost:8090/home.json")!
        let data = try! Data(contentsOf: url)
        
        let decoder = JSONDecoder()
        
        screen = try! decoder.decode(Screen.self, from: data)
        
        
        
        
        let content = UNMutableNotificationContent()
        content.title = "Blah Blah"
        content.body = "Body"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        //UNCalendarNotificationTrigger
        //UNlocationtrigger
        
        let request = UNNotificationRequest(identifier: "testIdentifier", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        
        coordinator = MainCoordinator(navigationController: navigationController!)
        
        window = UIWindow(frame: UIScreen.main.bounds)

        tableView.register(UINib(nibName: "TodayPlannerTableViewCell", bundle: nil), forCellReuseIdentifier: "todayPlannerTableViewCell")
        tableView.register(UINib(nibName: "PopularTableViewCell", bundle: nil), forCellReuseIdentifier: "popularTableViewCell")
        tableView.register(UINib(nibName: "DiscoverTableViewCell", bundle: nil), forCellReuseIdentifier: "discoverTableViewCell")
        tableView.register(UINib(nibName: "BlogTableViewCell", bundle: nil), forCellReuseIdentifier: "blogTableViewCell")
        
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        guard let window = window else { return 10.0}
        

        
// var heights:[CGFloat] = [trendingCellHeight,popularCellHeight,discoverCellHeight,blogCellHeight]
        
        let row = screen.rows[indexPath.row]
        
        switch row.rowType{
        case "carousel:trending":
            return 280
        case "card:recent":
            return 213
        case "imagecard:discover":
            return 128
        case "article:blog":
            return 237
        default:
            fatalError("Couldnt create cell")
            
        }
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return screen.rows.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let todayCell = tableView.dequeueReusableCell(withIdentifier: "todayPlannerTableViewCell", for: indexPath) as! TodayPlannerTableViewCell
        
        let row = screen.rows[indexPath.row]
        
        switch row.rowType{
            case "carousel:trending":
                let todayCell = tableView.dequeueReusableCell(withIdentifier: "todayPlannerTableViewCell") as! TodayPlannerTableViewCell
                todayCell.delegate = self
                todayCell.trending =  row.data.map{ data in
                        Trending(recipeName: data.title , recipeImage: data.background!, curatorImage: data.avatar!, tags: [Tag(tagName:"breakfast"),Tag(tagName:"easyfix")])
                }
                todayCell.selectionStyle = UITableViewCell.SelectionStyle.none
                return todayCell
            case "card:recent":
                let popularCell = tableView.dequeueReusableCell(withIdentifier: "popularTableViewCell") as!  PopularTableViewCell
                popularCell.delegate = self
                popularCell.popular = row.data.map{ data in
                    Popular(recipeName: data.title, recipeImage: data.background!, duration: data.subtitle!, curatorImage: data.avatar!, favorites: data.likes!)
                }
                
                popularCell.selectionStyle = UITableViewCell.SelectionStyle.none

                return popularCell
            case "imagecard:discover":
                let discoverCell = tableView.dequeueReusableCell(withIdentifier: "discoverTableViewCell") as!  DiscoverTableViewCell
                discoverCell.delegate = self
                discoverCell.discover = row.data.map{ data in
                      Discover(curatorName: data.title, curatorImage: data.avatar!)
            }
                discoverCell.selectionStyle = UITableViewCell.SelectionStyle.none

            return discoverCell

            case "article:blog":
            
                let blogCell = tableView.dequeueReusableCell(withIdentifier: "blogTableViewCell") as!  BlogTableViewCell
                blogCell.delegate = self
                blogCell.articles =  row.data.map{ data in
                        Article(articleName: data.title, articleImage: data.background!)
                }
                blogCell.selectionStyle = UITableViewCell.SelectionStyle.none
            return blogCell
        default:
                fatalError("Couldnt create cell")
            //Implement the cell catching ui that hides rowtypes not supported in app 
            
        }
    }
    
    @IBAction func unwindToHome(segue:UIStoryboardSegue) {
        
    }
}
