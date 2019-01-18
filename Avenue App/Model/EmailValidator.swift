//
//  EmailValidator.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 15/01/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation


enum EmailError:Error{
    case invalidEmail
}


class EmailValidator:NSObject {
    
    func validate(email:String) throws -> Bool {
        //Validate email count is more than six
        if (email.count < 6) {
            throw EmailError.invalidEmail
        }
        
        //Validate email doesnt have whitespace
        let whitespace = Set(" ")
        if (email.filter {whitespace.contains($0)}).count > 0 {
            throw EmailError.invalidEmail
        }
        
        //Validate email doesnt have numbers
        let numbers = Set("0123456789")
        if (email.filter {numbers.contains($0)}).count > 0 {
            throw EmailError.invalidEmail
        }
        //Validate email doesnt have special characters
        let specialCharacters = Set("+,!#$%^&*();\\/|<>\"")
        if (email.filter {specialCharacters.contains($0)}).count > 0 {
            throw EmailError.invalidEmail
        }
        
        
        //Valid whether email is valide expression
        guard let regexValidator = try? NSRegularExpression(pattern: "([A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4})", options: .caseInsensitive) else {
            throw EmailError.invalidEmail
        }
        
        
        if regexValidator.numberOfMatches(in: email,options: NSRegularExpression.MatchingOptions.reportCompletion,range: NSMakeRange(0, email.count)) > 0 {
            return true
        }
        
        throw EmailError.invalidEmail
    }

    
}
