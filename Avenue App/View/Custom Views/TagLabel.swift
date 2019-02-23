//
//  SATextField.swift
//  Beginner-Constraints
//
//  Created by Sean Allen on 11/29/18.
//  Copyright © 2018 Sean Allen. All rights reserved.
//

import UIKit


class TagLabel:UIView{
    var text:String
    var label = UILabel()
    
    
    init(text:String) {
        self.text = text
        super.init(frame: CGRect())
        setUpView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        self.text = "Hello"
        super.init(coder: aDecoder)
        setUpView()
    }
    
    func setUpView(){
        
        backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.9098039216, blue: 0.7803921569, alpha: 1)
        layer.cornerRadius = 8
        label.text = text
        label.font = UIFont(name: "Montserrat-Bold", size: 13)
        label.textAlignment = .center
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 21).isActive = true
        widthAnchor.constraint(equalTo: label.widthAnchor,multiplier:1.2).isActive = true
        
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
    }
    
    
}
