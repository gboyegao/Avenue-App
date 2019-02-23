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
        addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: UIControl.Event.valueChanged)

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSegmentedControlView()
        addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: UIControl.Event.valueChanged)

    }
    
    //Abstract into single function
    func setupSegmentedControlView(){
        setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "Montserrat-SemiBold", size: 15),
            NSAttributedString.Key.foregroundColor: UIColor.lightGray
            ], for: .normal)
        
        setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "Montserrat-SemiBold", size: 14),
            NSAttributedString.Key.foregroundColor: UIColor.orange
            ], for: .selected)
        translatesAutoresizingMaskIntoConstraints = false
        
        
        buttonBar.translatesAutoresizingMaskIntoConstraints = false
        buttonBar.backgroundColor = .orange
        addSubview(buttonBar)
        
        // Constrain the top of the button bar to the bottom of the segmented control
        buttonBar.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        buttonBar.heightAnchor.constraint(equalToConstant: 5).isActive = true
        // Constrain the button bar to the left side of the segmented control
        buttonBar.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        // Constrain the button bar to the width of the segmented control divided by the number of segments
        buttonBar.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1 / CGFloat(self.numberOfSegments)).isActive = true
        
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        UIView.animate(withDuration: 0.3){
            self.buttonBar.frame.origin.x = (self.frame.width / CGFloat(self.numberOfSegments)) * CGFloat(self.selectedSegmentIndex)
            
        }
    }
    
    

    
    
}
