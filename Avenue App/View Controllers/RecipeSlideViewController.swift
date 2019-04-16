//
//  RecipeSlideViewController.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 04/03/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import UIKit

class RecipeSlideViewController: UIViewController {
    
    var steps:[Step]!
    
    
    @IBOutlet weak var leftContainerView: UIView!
    @IBOutlet weak var stepTextLabel: UILabel!
    @IBOutlet weak var stepImageView: RoundedImageView!
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
    
    
    func setUpView(){
        
        
    }
}
