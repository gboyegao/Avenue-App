//
//  BlogContent.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 13/04/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation


public protocol BlogContent {
}

struct HeadlineContent:BlogContent{
        var headline:String
}

struct TextContent:BlogContent{
    var text:String
}

struct ImageContent:BlogContent{
    var imageURL:String
}


public func loadBlogContent() -> [BlogContent]{
    let blogContent:[BlogContent] = [
        HeadlineContent(headline: "Lorem ipsum dolor sit amet"),
        TextContent(text:"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
        ImageContent(imageURL:"https://techcrunch.com/wp-content/uploads/2019/03/Team-Mobot.png")
    ]
    
    return blogContent
}
