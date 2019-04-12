//
//  RegisterViewController.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 09/01/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import UIKit
import Firebase
import SafariServices




class RegisterViewController: UIViewController{
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    var signupModel:SignupModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO- Move to Function
        //Listening for keyboard events
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
    

        
    }
    
    //Remove Notification Observer
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    
    
    
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text, let confirmPassword = confirmTextField.text else{return}
        
        if password != confirmPassword {
            errorLabel.text = "Password doesnt match "
            
        }
            
        //TODO Validate USername
        
        else{
            
            
            do {
                signupModel = try SignupModel(email: email, password: password)
            }
            catch EmailError.invalidEmail{
                    errorLabel.text = "Email address is invalid"
                    return
            }
            catch PasswordError.lengthError{
                    errorLabel.text! = "Password should be more than six characters"
                    return

            }
            catch PasswordError.lowecaseError{
                errorLabel.text!  = "Password should contain lowercase character"
                return
            }
            catch PasswordError.numberError{
                errorLabel.text!  = "Password should contain a number"
                return

            }
            catch PasswordError.uppercaseError{
                errorLabel.text!  = "Password should have a uppercase character"
                return

            }
            catch PasswordError.whitespaceError{
                errorLabel.text! = "Password should not have white space"
                return
            }
            catch {
                print(error)
               
            }

            
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                // ...
                
                if error != nil {
                    print(error!.localizedDescription)
                    self.errorLabel.text = "\(error!.localizedDescription)"
                    return
                }
                
                guard let user = authResult?.user else { return }
                let uid = user.uid
                //Add User to Database change to firestore
                let ref = Database.database().reference()
                
                ref.child("Users").child(uid).setValue(email)
                
                ref.child("Users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
                    //Use Snapshot
                    snapshot.value
                }
                    
                    
                )
                
                self.defaults.set(true, forKey: UDKey.LoggedIn.rawValue)
                self.performSegue(withIdentifier: "registerToHome", sender: self)

                
            }
        }
        
    }
    
    @IBAction func emailDidEndOnExit(_ sender: Any) {
        emailTextField.resignFirstResponder()
        
    }
    
    @IBAction func usernameDidEndOnExit(_ sender: Any) {
        userNameTextField.resignFirstResponder()
    }
    
    @IBAction func passwordDidEndOnExit(_ sender: Any) {
        passwordTextField.resignFirstResponder()
        
    }
    
    
    @IBAction func confirmPasswordDidEndOnExit(_ sender: Any) {
        confirmTextField.resignFirstResponder()
        loginButtonPressed("")
    }
    
    
    
    @IBAction func termsAndConditions(_ sender: Any) {
        showSafariVC(for: "https://google.com")
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
    
    func showSafariVC(for url:String){
        guard let url = URL(string: url) else {return}
        
        let safariVC  = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }

    
    
    
    
    }
