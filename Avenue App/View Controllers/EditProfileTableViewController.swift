//
//  EditProfileTableViewController.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 24/04/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import UIKit




class EditProfileTableViewController: UITableViewController,ProfileDetailDelegate{
    var firstName: String? = UserDataController.loadFirstName()
    var lastName: String?  = UserDataController.loadLastName()
    

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstNameTextField.text = UserDataController.loadFirstName()
        lastNameTextField.text = UserDataController.loadLastName()
        emailTextField.text = UserDataController.loadEmail()
    }
    
    @IBAction func firstNameEditingChanged(_ sender: Any) {
        firstName = firstNameTextField.text
    }
    
    
    @IBAction func lastNameEditingChanged(_ sender: Any) {
        lastName = lastNameTextField.text
    }
    
    
    
    
    
}
