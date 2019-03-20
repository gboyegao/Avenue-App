//
//  RoundedButton.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 03/03/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class RoundedButton: UIButton{
    override init(frame: CGRect) {
        super.init(frame: frame)
         
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    @IBInspectable var buttonHeight: CGFloat = 0.0{
        didSet{
            self.frame.size.height = buttonHeight
            layer.cornerRadius = buttonHeight/2
             }
    }
    @IBInspectable var buttonWidth: CGFloat = 0.0{
        didSet{
            self.frame.size.width = buttonWidth
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
}

