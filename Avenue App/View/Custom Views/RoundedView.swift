//
//  CustomView.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 21/02/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class RoundedView: UIView{
    
    @IBInspectable var circleWidth: CGFloat = 0.0{
        didSet{
            self.frame.size.width = circleWidth
            self.frame.size.height = circleWidth
            layer.cornerRadius = circleWidth/2
            
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0.0{
        
        didSet{
            self.layer.borderWidth = borderWidth
            print(borderWidth/2)
            
            
        }
    }
    
    

    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        
        didSet {
            
            self.layer.borderColor = borderColor.cgColor
        }
    }
    override func prepareForInterfaceBuilder() {
        
        super.prepareForInterfaceBuilder()
    }
    
}
