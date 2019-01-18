//
//  LogInViewController.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 09/01/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import UIKit
import Firebase

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Listening for keyboard events
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name:UIResponder.keyboardWillHideNotification , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)


        // Do any additional setup after loading the view.
    }
    //Remove Nototification Observer
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }

    @IBAction func emailDidEndOnExit(_ sender: Any) {
        emailTextField.resignFirstResponder()
    }
    
    @IBAction func passwordDidEndOnExit(_ sender: Any) {
        passwordTextField.resignFirstResponder()
    }
    
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {return}
        
        Auth.auth().signIn(withEmail: email, password: password, completion: {(authResult,error)
            in
            
            if error != nil {
                print(error!.localizedDescription)
                self.errorLabel.text = "\(error!.localizedDescription)"
                return
            }
            self.performSegue(withIdentifier: "loginToHome", sender: self)
            
        })
    }
    
    @objc func keyboardWillChange(notification: Notification){
        print("Keyboard will show:\(notification.name.rawValue)")
        
        guard let info = notification.userInfo, let keyboardFrameValue = info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else {return}
        
        let keyboardFrame = keyboardFrameValue.cgRectValue
        let keyboardSize = keyboardFrame.size
        
        
        switch notification.name {
        case UIResponder.keyboardWillHideNotification:
            view.frame.origin.y = 0
        case UIResponder.keyboardWillShowNotification:
            view.frame.origin.y = -keyboardSize.height/2
        default:
            print("Change")
        }
    }

}
