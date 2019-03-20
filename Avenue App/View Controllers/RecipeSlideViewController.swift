//
//  RecipeSlideViewController.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 04/03/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import UIKit

class RecipeSlideViewController: UIViewController {
    
    @IBOutlet weak var leftContainerView: UIView!

    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    @IBAction func leftGestureTap(_ sender: Any) {
        print("Left Tapped")
    }
    
    @IBAction func rightGestureTap(_ sender: Any) {
        print("Right Tapped")
    }
    @objc func handleTap(sender: UITapGestureRecognizer? = nil) {
        // handling code
        print("Hello")
    }
}
