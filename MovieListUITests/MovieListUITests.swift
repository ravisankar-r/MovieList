//
//  MovieListUITests.swift
//  MovieListUITests
//
//  Created by Ravi on 5/3/17.
//  Copyright © 2017 RaviSankar. All rights reserved.
//

import XCTest

class MovieListUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFilterView() {
       
        XCUIDevice.shared().orientation = .faceUp
        
        let app = XCUIApplication()
        app.navigationBars["Movies"].buttons["filter"].tap()
        
        let filterText = app.staticTexts["Filter Movies"]
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith:filterText, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
    
        XCTAssert(app.buttons["Apply"].exists)
        XCTAssert(app.staticTexts["Max Release Year"].exists)
        XCTAssert(app.staticTexts["Min Release Year"].exists)
        XCTAssert(app.sliders.element(boundBy: 0).exists)
        XCTAssert(app.sliders.element(boundBy: 1).exists)
        app.buttons["Apply"].tap()
    }
    
    
    func testDetailView(){
        
        XCUIDevice.shared().orientation = .faceUp
        
        let app = XCUIApplication()
        let cell = app.tables.cells.element(boundBy: 0)
        XCTAssert(cell.exists)
        cell.tap()
        
        let navButton = app.navigationBars["MovieList.MovieDetailView"].buttons["Movies"]
        let exists = NSPredicate(format: "exists == true")
        
        expectation(for: exists, evaluatedWith:navButton, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        navButton.tap()
    }
    
}
