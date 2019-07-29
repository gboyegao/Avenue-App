//
//  Screen.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 29/05/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation


struct Screen:Decodable{
    let rows:[Row]
}

struct Row:Decodable{
    let title:String
    let rowType:String
    let data:[RowData]

}

struct RowData:Decodable {
    let id:String
    let title:String
    let subtitle:String?
    let background:String?
    let avatar:String?
    let likes:String?
    
}
