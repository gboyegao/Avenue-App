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
        TextContent(
            text:
            """
            <!DOCTYPE html><html>
                <body>
                    <h1>This is heading 1</h1>
                    <h2>This is heading 2</h2>
                    <h3>This is heading 3</h3>
                    <h4>This is heading 4</h4>
                    <p>
                        This is a Paragraph
                        <b>Hello</b>
                        <a>This is a link</a>
                        <ol>
                        <li>This is a list</li>
                        <li>This is a list</li>
                        <li>This is a list</li>
                        </ol>
                    </p>
                    <h6>This is heading 6</h6>
                    <img src=\"https://techcrunch.com/wp-content/uploads/2019/03/Team-Mobot.png\">

                </body>
            </html>
            """
        ),
       // ImageContent(imageURL:"https://techcrunch.com/wp-content/uploads/2019/03/Team-Mobot.png"),
    TextContent(text:"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
        //ImageContent(imageURL:"https://techcrunch.com/wp-content/uploads/2019/03/Team-Mobot.png")
    ]
    
    return blogContent
}
