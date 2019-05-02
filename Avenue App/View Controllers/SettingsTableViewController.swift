//
//  SettingsTableViewController.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 13/02/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI



class SettingsTableViewController: UITableViewController,MFMailComposeViewControllerDelegate{
    
    
    @IBOutlet weak var curatorNameLabel: UILabel!
    
    
    
    let defaults = UserDefaults.standard
    var editProfileIndexPath     =  IndexPath(row: 0, section: 0)
    var notificationsIndexPath   =  IndexPath(row: 0, section: 1)
    var aboutUsIndexPath         =  IndexPath(row: 1, section: 1)
    var helpIndexPath            =  IndexPath(row: 2, section: 1)
    var rateAppIndexPath         =  IndexPath(row: 3, section: 2)
    var logOutIndexPath =  IndexPath(row: 0, section: 2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {        
        curatorNameLabel.text = "\(UserDataController.loadFirstName()) \(UserDataController.loadLastName())"

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath {
            
        case editProfileIndexPath:
            performSegue(withIdentifier: "editProfile", sender: nil)
            break
        case notificationsIndexPath:
            performSegue(withIdentifier: "notifications", sender: nil)
            break
        case aboutUsIndexPath:
            performSegue(withIdentifier: "aboutUs", sender: nil)
            break
        case helpIndexPath:
            guard MFMailComposeViewController.canSendMail() else {
                print("Can not send mail")
                return
            }
            let mailComposer = MFMailComposeViewController()
            mailComposer.mailComposeDelegate = self
            mailComposer.setToRecipients(["example@example.com"])
            print("Mail Pressed")
            present(mailComposer, animated: true, completion: nil)
            
            break
        case rateAppIndexPath:
            rateApp()
            break
        case logOutIndexPath:
            print("LoggedOut")
            logOutTapped()
        default:
            break
        }
    }
    
    func rateApp() {
      if let url = URL(string: "itms-apps://itunes.apple.com/app/" + "appId") {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                
            } else {
                UIApplication.shared.openURL(url)
            }
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
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil)
    }
    
    func logOut(){
        //LogOut from Firebase
        //Logout from Google if logged in
        //set isloggedIn in userpreference to false
        //segue to home
         self.defaults.set(false, forKey: UDKey.LoggedIn.rawValue)
         let storyboard = UIStoryboard(name: "Main",bundle:nil)
         let firstVC = storyboard.instantiateViewController(withIdentifier:"Welcome")
         UIApplication.setRootView(firstVC)
        
        
    
    }
    
}

extension UIApplication{
    public static func setRootView(_ viewController: UIViewController){
        UIApplication.shared.keyWindow?.rootViewController = viewController
}
}
