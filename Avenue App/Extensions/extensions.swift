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

extension String{
    var wrappedIntoStyle:String{
        let bounds:CGRect = UIScreen.main.bounds
        let semiBoldfont = "Montserrat-SemiBold"
        let regularFont = "montserrat-regular"
        let boldFont = "Montserrat-Bold"
        let fontSize = 19
        let lineHeight = 25
        let imageWidth = bounds.width - 40
        let margin = 20

        let htmlString = """
            <style>
        body{
            font-family:\"\(regularFont)\";
        }
        p,li {
            color:#000080;
            font-family:\"\(regularFont)\";
            font-size:\"\(fontSize)px\";
            line-height:\(lineHeight)px;
            margin:10px;
        }
        h1,h2,h3,h4,h5,h6{
        font-family:\"\(semiBoldfont)\";
        margin:10px;
        }
        a{
        
        }
        img{
        max-width = \(imageWidth);
        }
            </style>
            \(self)
        """
        return htmlString
    }


    func convertHtml() -> NSAttributedString{
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do{
        return try NSAttributedString(data: data, options: [
                .documentType:NSAttributedString.DocumentType.html,
                .characterEncoding:String.Encoding.utf8.rawValue
                ],
                documentAttributes: nil)
        }catch{
            return NSAttributedString()
        }
    }
}

