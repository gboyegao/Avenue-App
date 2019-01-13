//
//  Recipe.swift
//  Avenue AppTests
//
//  Created by Adegboyega Olusunmade on 27/11/2018.
//  Copyright © 2018 Gboyega. All rights reserved.
//

import XCTest
@testable import Avenue_App

class RecipeStructTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit_RecipeWithoutTags(){
        let testMovie = Recipe()
        XCTAssertNotNil(testMovie)
//        XCTAssertEqual(testMovie.title, "Generic Blockbuster")
    }

}
