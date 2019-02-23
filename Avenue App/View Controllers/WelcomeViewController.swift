//
//  WelcomeViewController.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 09/01/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import SafariServices

class WelcomeViewController: UIViewController, GIDSignInUIDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.uiDelegate = self
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        if Auth.auth().currentUser != nil {
//            self.performSegue(withIdentifier: "alreadyLoggedIn", sender: nil)
//        }
    }
    
    @IBAction func continueWithGoogle(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    
    @IBAction func termsAndConditions(_ sender: Any) {
        showSafariVC(for: "https://google.com")
    }
    
    
    func showSafariVC(for url:String){
        guard let url = URL(string: url) else {return}
        
        let safariVC  = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }

    @IBAction func unwindToWelcome(unwindSegue: UIStoryboardSegue){
        
    }
    
    
}
