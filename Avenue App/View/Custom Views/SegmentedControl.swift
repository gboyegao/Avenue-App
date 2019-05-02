//
//  SegmentedControl.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 22/02/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation
import UIKit


class SegmentedControl:UISegmentedControl{
    
    let buttonBar = UIView()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupSegmentedControlView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       setupSegmentedControlView()
    }
    
    //Abstract into single function
    func setupSegmentedControlView(){
        setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "Montserrat-SemiBold", size: 13)], for: .normal)
        
        
        
        setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "Montserrat-SemiBold", size: 14)
            ], for: .selected)
    }
    
    
    

    
    
}
