//
//  AppDelegate.swift
//  Avenue App
//
//  Created by Gboyega on 25/08/2018.
//  Copyright © 2018 Gboyega. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import InstantSearch
import RealmSwift
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,GIDSignInDelegate,UNUserNotificationCenterDelegate{
    
    let defaults = UserDefaults.standard
    var window: UIWindow?
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void){
            completionHandler([.alert,.sound])
    }


    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound], completionHandler: {
            (granted,error) in
              print(granted)
        })
        
        UserDataController.createUser(firstName: "Adegboyega", lastName: "Olusunmade", email: "gb@rix.com", id: "fdjfvbd")

        
        FirebaseApp.configure()
        
        let db = Firestore.firestore()
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
        GIDSignIn.sharedInstance()?.clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance()?.delegate = self
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        self.defaults.set(true, forKey: UDKey.LoggedIn.rawValue)
        let storyboard = UIStoryboard(name: "Main",bundle:nil)
        var firstVC = storyboard.instantiateViewController(withIdentifier: "Welcome")
        let loggedIn = defaults.bool(forKey: UDKey.LoggedIn.rawValue)
        if loggedIn {
            //segue
            firstVC = storyboard.instantiateViewController(withIdentifier: "HomeTabBar")
            
        }
        
        InstantSearch.shared.configure(appID: "latency", apiKey: "1f6fd3a6fb973cb08419fe7d288fa4db", index: "bestbuy_promo")
        InstantSearch.shared.params.attributesToRetrieve = ["name", "salePrice"]
        InstantSearch.shared.params.attributesToHighlight = ["name"]

        window?.rootViewController = firstVC
        window?.makeKeyAndVisible()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url, sourceApplication:options[UIApplication.OpenURLOptionsKey.sourceApplication] as?String,annotation: [:])

    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    
    
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let err = error {
            print("Failed attempt to login to Google")
            print(err.localizedDescription)
            return
        }
        print("Successfully Logged In")
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,accessToken: authentication.accessToken)
        
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let error = error {
                print("Failed to create a FirebaseUser")
                print(error.localizedDescription)
                return
            }
            print("User is signed in")
            self.defaults.set(true, forKey: UDKey.LoggedIn.rawValue)
            
            
            if self.window?.rootViewController is LogInViewController {
                //do something if it's an instance of that class
                self.window?.rootViewController?.performSegue(withIdentifier: "loginToHome", sender: nil)
                
            }
            else{
                self.window?.rootViewController?.performSegue(withIdentifier: "alreadyLoggedIn", sender: nil)
            }
            
            
            
        }
        
    }


}

