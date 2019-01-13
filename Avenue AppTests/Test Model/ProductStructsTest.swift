//
//  ProductStructsTest.swift
//  Avenue AppTests
//
//  Created by Adegboyega Olusunmade on 27/11/2018.
//  Copyright © 2018 Gboyega. All rights reserved.
//

import XCTest
@testable import Avenue_App
class ProductStructsTest: XCTestCase {

    let testReview = Review(rating:2,description:"Amazing Product",reviewer:"Michael")
    let cheapTag = Tag(tagName: "Cheap")

    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //MARK: Initialize Product with Products
    func testInit_ProductWithoutTagsAndReviews(){
        let testProduct = Product(name: "Tasty Fresh Milk", price: 1000, description: "Lorem ipsum dolor sit amet", image: UIImage(named: "blog-image")!)
        XCTAssertNotNil(testProduct)
        XCTAssertEqual(testProduct.name, "Tasty Fresh Milk")
        XCTAssertEqual(testProduct.price, 1000)
        XCTAssertEqual(testProduct.description, "Lorem ipsum dolor sit amet")
        XCTAssertEqual(testProduct.image, UIImage(named: "blog-image")!)
    }
    
    func testInit_ProductWithTags(){
        let testProduct = Product(name:"Tasty Fresh Milk",price:1000,description:"Lorem ipsum dolor sit amet",image:UIImage(named: "blog-image")!,tags:[cheapTag])
        XCTAssertNotNil(testProduct)
        XCTAssertNil(testProduct.reviews)
        XCTAssertEqual(testProduct.name, "Tasty Fresh Milk")
        XCTAssertEqual(testProduct.price, 1000)
        XCTAssertEqual(testProduct.description, "Lorem ipsum dolor sit amet")
        XCTAssertEqual(testProduct.image, UIImage(named: "blog-image")!)
        XCTAssertEqual(testProduct.tags, [cheapTag])

    }
    
    
    //Initializing Review
    func testInit_Review(){
        XCTAssertNotNil(testReview)
        XCTAssertEqual(testReview.rating, 2)
        XCTAssertEqual(testReview.description, "Amazing Product")
        XCTAssertEqual(testReview.reviewer, "Michael")
    }
    
    func testInit_ReviewReturnsRatingValueWithinZeroAndFive(){
        let maxtestReview = Review(rating:6,description:"Amazing Product",reviewer:"Michael")
        let mintestReview = Review(rating:-9,description:"Amazing Product",reviewer:"Michael")
        
        XCTAssertEqual(maxtestReview.rating, 5)
        XCTAssertEqual(mintestReview.rating, 0)
    }
    
    func testInit_ProductWithReviews(){
        let testProduct = Product(name:"Tasty Fresh Milk",price:1000,description:"Lorem ipsum dolor sit amet",image:UIImage(named: "blog-image")!,reviews:[testReview])
        XCTAssertNotNil(testProduct)
        XCTAssertEqual(testProduct.name, "Tasty Fresh Milk")
        XCTAssertEqual(testProduct.price, 1000)
        XCTAssertEqual(testProduct.description, "Lorem ipsum dolor sit amet")
        XCTAssertEqual(testProduct.image, UIImage(named: "blog-image")!)
        XCTAssertEqual(testProduct.reviews, [testReview])
    }
    func testInit_ProductWithTagsAndReviews(){
    let testProduct = Product(name:"Tasty Fresh Milk",price:1000,description:"Lorem ipsum dolor sit amet",image:UIImage(named: "blog-image")!,tags:[cheapTag],reviews:[testReview])
        XCTAssertNotNil(testProduct)
        XCTAssertEqual(testProduct.reviews, [testReview])
        XCTAssertEqual(testProduct.tags, [cheapTag])


    }

}
