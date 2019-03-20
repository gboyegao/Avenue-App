//
//  IngredientsViewController.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 03/03/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import UIKit

class IngredientsViewController: UIViewController {
    var coordinator:MainCoordinator?
    
    @IBOutlet weak var ingredientsTableView: UITableView!
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
