//
//  Tag.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 27/11/2018.
//  Copyright © 2018 Gboyega. All rights reserved.
//

import Foundation

struct Tag:Equatable{
    let tagName:String
    
    static func == (lhs:Tag,rhs:Tag) -> Bool{
        return lhs.tagName == rhs.tagName
    }
}
