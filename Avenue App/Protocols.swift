//
//  protocols.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 16/02/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation


protocol CollectionViewDelegate:AnyObject {
    //MAKE GENERIC
    var trending:[Trending]{get}
    func todayCell(_ atIndex:Int)
}
