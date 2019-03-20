//
//  ViewController.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 06/03/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import UIKit

extension UIViewController {
    static func instantiate(storyboardName:String) -> UIViewController{
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        
        return storyboard.instantiateViewController(withIdentifier: id)
    }

}
