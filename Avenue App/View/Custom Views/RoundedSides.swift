//
//  RoundedSides.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 25/02/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation
import UIKit



class RoundedSides:UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = self.frame.width / 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = self.frame.width / 2
        
    }
    
    
}
