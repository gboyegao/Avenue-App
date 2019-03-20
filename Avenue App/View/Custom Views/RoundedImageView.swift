//
//  RoundedImageView.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 05/03/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class RoundedImageView: UIImageView{
    
    @IBInspectable var cornerRadius: CGFloat = 0.0{
        didSet{
            layer.cornerRadius = cornerRadius
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
        self.layer.borderColor = #colorLiteral(red: 0.968627451, green: 0.737254902, blue: 0.3529411765, alpha: 1)
        clipsToBounds = true
        super.prepareForInterfaceBuilder()
    }
    
}
