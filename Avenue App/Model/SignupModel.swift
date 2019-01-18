//
//  SignupModel.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 15/01/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation

class SignupModel: NSObject {
    var email:String
    var password:String
    
    init(email:String,password:String,emailAddressValidator:EmailValidator? = nil,passwordValidator:PasswordValidator? = nil) throws {
        
        let Validator1 = emailAddressValidator ?? EmailValidator()
        let Validator2 = passwordValidator ?? PasswordValidator()
        
        try Validator1.validate(email: email)
        try Validator2.validate(password: password)
        
        
        self.email = email
        self.password = password

        
        super.init()
    }
}


