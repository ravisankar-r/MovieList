//
//  BindableTests.swift
//  MovieList
//
//  Created by ctsuser1 on 5/6/17.
//  Copyright © 2017 RaviSankar. All rights reserved.
//

import Foundation
import XCTest
@testable import MovieList

class BindableTests: XCTestCase {
    
    func testBind() {
        let bindable = Bindable(false)
        
        let expectListenerCalled = expectation(description: "Listener is called")
        bindable.bind { value in
            XCTAssert(value == true, "testBind failed")
            expectListenerCalled.fulfill()
        }
        
        bindable.value = true
        waitForExpectations(timeout: 0.1, handler: nil)
    }
    
    func testBindAndFire() {
        let bindable = Bindable(true)
        
        let expectListenerCalled = expectation(description: "Listener is called")
        bindable.bindAndFire { value in
            XCTAssert(value == true, "testBindAndFire failed")
            expectListenerCalled.fulfill()
        }
        
        waitForExpectations(timeout: 0.1, handler: nil)
    }
}
