//
//  KeyboardService.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 03/04/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation
import UIKit



class KeyboardService{
    let view:UIView
    let viewController:UIViewController
    
    init(view:UIView,_ viewController:UIViewController) {
        self.view = view
        self.viewController = viewController
    }
    
    //Add Keyboard Notification Observer
   @objc func addKeyboardNotificationObserver(){
        NotificationCenter.default.addObserver(viewController, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(viewController, selector: #selector(keyboardWillChange(notification:)), name:UIResponder.keyboardWillHideNotification , object: nil)
        NotificationCenter.default.addObserver(viewController, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    
    
    }
    
    //Remove Keyboard Notification Observer
    @objc func removeKeyboardNotificationObserver(){
        NotificationCenter.default.removeObserver(viewController, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(viewController, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(viewController, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    //Keyboard Will Change Shift View
    
    @objc func keyboardWillChange(notification: Notification){
        print("Keyboard will show:\(notification.name.rawValue)")
        
        guard let info = notification.userInfo, let keyboardFrameValue = info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else {return}
        
        let keyboardFrame = keyboardFrameValue.cgRectValue
        let keyboardSize = keyboardFrame.size
        
        
        switch notification.name {
        case UIResponder.keyboardWillHideNotification:
            view.frame.origin.y = 0
        case UIResponder.keyboardWillShowNotification:
            view.frame.origin.y = -keyboardSize.height/2
        default:
            print("Change")
        }
    }
    
}
