//
//  SystemVC.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 03/03/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation
import SafariServices
import UIKit
import AVKit

class SystemVC{
    
    func showSafariVC(for url:String,viewcontroller:UIViewController){
        guard let url = URL(string: url) else {return}
        
        let safariVC  = SFSafariViewController(url: url)
        viewcontroller.present(safariVC, animated: true)
    }
    
    func showPlayerVC(for url:URL,viewcontroller:UIViewController){
        let player = AVPlayer(url: url)
        
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        player.play()
        
        viewcontroller.present(playerViewController,animated: true)
    }

    
    
    

}
