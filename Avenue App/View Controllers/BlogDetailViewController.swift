//
//  BlogDetailViewController.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 06/03/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import UIKit

class BlogDetailViewController: UIViewController {

    var blogContent:[BlogContent] = loadBlogContent()
    var coordinator:MainCoordinator?
    var articleName:String!
    var imageURL:String!
    var imageDictionary:[IndexPath:UIImage] = [:]
    
    @IBOutlet weak var articleNameLabel: UILabel!
    @IBOutlet weak var blogTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator = MainCoordinator(navigationController: navigationController!)
         navigationController?.setNavigationBarHidden(true, animated: true)
        setUpView()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    func setUpView(){
        articleNameLabel.text = articleName
        blogTableView.delegate = self
        blogTableView.dataSource = self
    }
}

extension BlogDetailViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let approximateWidthOfTextView = view.frame.width - 40
        let size = CGSize(width: approximateWidthOfTextView, height: 1000)
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Montserrat-SemiBold", size: 14)]
        
        switch blogContent[indexPath.row]{
        case let content as HeadlineContent:
            let estimatedFrame = NSString(string: content.headline).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes , context: nil)
            return estimatedFrame.height + 11
            
        case let content as TextContent:
            let estimatedFrame = NSString(string: content.text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes , context: nil)
            return estimatedFrame.height + 11
        case _ as ImageContent:
            guard let image = self.imageDictionary[indexPath] else { return  0}
            let ratio = image.size.width / image.size.height
            let newHeight = (view.frame.width - 40) / ratio
            return newHeight
        default:
            return 0.0
        }
    }
    
}

extension BlogDetailViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blogContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch blogContent[indexPath.row]{
            case let content as HeadlineContent:
                let cell = tableView.dequeueReusableCell(withIdentifier: "blogHeadingCell") as! HeadlineContentTableViewCell
                cell.headlineLabel.text = content.headline
                return cell
            case let content  as TextContent:
                let cell = tableView.dequeueReusableCell(withIdentifier: "blogTextCell") as! TextContentTableViewCell
                cell.textContentLabel.text = content.text
                return cell
            case let content as ImageContent:
                let cell = tableView.dequeueReusableCell(withIdentifier: "blogImageCell") as! ImageContentTableViewCell
                
                guard let url = URL(string: content.imageURL) else { return cell}
                ImageService.getImage(withURL: url, completion: {
                    image in
                    self.imageDictionary[indexPath] = image
                    cell.imageContentView.image = image
                })
                
                
                
                cell.setUpView(imageURL: content.imageURL)
                return cell
            default:
                return UITableViewCell()
        }
    }
    
    
}


