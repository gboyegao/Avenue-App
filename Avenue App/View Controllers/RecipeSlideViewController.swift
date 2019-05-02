//
//  RecipeSlideViewController.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 04/03/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import UIKit

class RecipeSlideViewController: UIViewController {
    
    var coordinator:MainCoordinator?
    var steps:[Step]!
    var currentSlide:Int!{
        didSet{
                    }
    }
    
    
    @IBOutlet weak var leftContainerView: UIView!
    @IBOutlet weak var stepTextLabel: UILabel!
    @IBOutlet weak var stepImageView: RoundedImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    

    
    @IBAction func leftGestureTap(_ sender: Any) {
        print("Left Tapped")
        while currentSlide != 0 {
            currentSlide -= 1
        }
        setUpView()
    }
    
    @IBAction func rightGestureTap(_ sender: Any) {
        print("Right Tapped")
        while currentSlide != steps.count - 1{
            currentSlide += 1
        }
        setUpView()

    }
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }

    func setUpView(){
        stepTextLabel.text = steps[currentSlide].text
        guard let urlString = steps[currentSlide].imageURL, let url = URL(string: urlString) else {
            self.stepImageView.isHidden = true
            return
            
        }
        
        ImageService.getImage(withURL: url, completion: {
            image in
                self.stepImageView.image = image
        })
        
    }
}
