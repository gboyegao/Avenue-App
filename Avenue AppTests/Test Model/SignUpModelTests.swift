//
//  SignUpModelTests.swift
//  Avenue AppTests
//
//  Created by Adegboyega Olusunmade on 15/01/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import XCTest
@testable import Avenue_App

class SignUpModelTests: XCTestCase {
    private let validDummyEmail = "gboyegaolusunmade@gmail.com"
    private let validDummyPassword = "Aryb4N79"
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//MARK Initializer tests
    func testInit_validEmailAndValidPassword(){
        XCTAssertNoThrow(try SignupModel(email:validDummyEmail,password:validDummyPassword))
    }
   

}
