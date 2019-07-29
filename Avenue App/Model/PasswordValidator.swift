//
//  PasswordValidator.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 15/01/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation

enum PasswordError:Error{
    case lengthError
    case whitespaceError
    case lowecaseError
    case uppercaseError
    case numberError
}

class PasswordValidator:NSObject{
    func validate(password:String) throws -> Bool {
        
            //Validate Length should be between 6 and 10 characters in length
            if (password.count < 6) {
                throw PasswordError.lengthError
            }
        
            //MARK: Must not Contain whitespace
            let whitespace = Set(" ")
            if (password.filter {whitespace.contains($0)}).count > 0 {
                throw PasswordError.whitespaceError
            }
        
            //MARK:  Must Contain one uppercase letter
            let uppercaseAlphabets = Set("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
            if (password.filter {uppercaseAlphabets.contains($0)}).count == 0 {
                throw PasswordError.uppercaseError
            }
        
            //MARK:  Must Contain one lowercase letter
            let lowercaseAlphabets = Set("abcdefghijklmnopqrstuvwxyz")
            if (password.filter {lowercaseAlphabets.contains($0)}).count == 0 {
                throw PasswordError.lowecaseError
            }
        
            //MARK:  Must Contain one number
            let numbers = Set("01234567890")
            if (password.filter{numbers.contains($0)}).count == 0 {
                throw PasswordError.numberError
            }

        return true
        
    }
    
}
