//
//  SettingsTableViewController.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 13/02/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import UIKit


class SettingsTableViewController: UITableViewController {
    let defaults = UserDefaults.standard
    var logOutIndexPath =  IndexPath(row: 0, section: 3)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath.row,indexPath.section) {
        case (logOutIndexPath.row,logOutIndexPath.section):
            print("LoggedOut")
            logOutTapped()
        default:
            break
        }
    }
    
    func logOutTapped(){
        let alertController = UIAlertController(title: "Log Out", message: "Are you sure you want to log out of Avenue?", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            action in
                print("User Cancelled")
        })
        
        let logOutAction = UIAlertAction(title: "Log Out", style: .destructive  , handler: {
            action in
            print("User Logged Out")
            self.logOut()
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(logOutAction)
        
        present(alertController, animated: true, completion: nil)

    }
    
    
    func logOut(){
        //LogOut from Firebase
        //Logout from Google if logged in
        //set isloggedIn in userpreference to false
        //segue to home
         self.defaults.set(false, forKey: UDKey.LoggedIn.rawValue)
         let storyboard = UIStoryboard(name: "Main",bundle:nil)
         let firstVC = storyboard.instantiateViewController(withIdentifier: "Welcome")
         UIApplication.setRootView(firstVC)
        
    
    }
    
}

extension UIApplication{
    public static func setRootView(_ viewController: UIViewController){
        UIApplication.shared.keyWindow?.rootViewController = viewController
}
}
