//
//  RegisterViewController.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 09/01/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ref = Database.database().reference()
        
        
        ref.child("someid/name").setValue("Mike")


        // Do any additional setup after loading the view.
    }
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text else{return}
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            // ...
            guard let user = authResult?.user else { return }
            let uid = user.uid
            let ref = Database.database().reference()
            
            ref.child("Users").child(uid).setValue(email)
            
        }
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
