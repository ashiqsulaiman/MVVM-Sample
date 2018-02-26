//
//  NestawayUITests.swift
//  NestawayUITests
//
//  Created by Ashiq Sulaiman on 25/02/18.
//  Copyright © 2018 Ashiq Sulaiman. All rights reserved.
//

import XCTest

class NestawayUITests: XCTestCase {
      var app: XCUIApplication!
    
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launchArguments.append("--uitesting")

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    

    

    func testSearchBar(){
        app.launch()
        let searchBar = app.otherElements["searchBar"]
        searchBar.tap()
        searchBar.searchFields.element.typeText("Avengers Infinity War")
        app.buttons["Go"].tap()
        XCTAssertEqual(app.keyboards.count, 0)
        
    }
    
    
    func testScrollAndTapOnTweetTableView(){
        app.launch()
        let tablesQuery = app.tables
        let tableElement = tablesQuery.element
        tableElement.swipeUp()
        let cellQuery = self.app.tables.cells.element(boundBy: 3)
        cellQuery.tap()
        XCTAssertTrue(app.isUserInfoScreen)
    }
    
    
    func testTappedOnBackFromUserInfoView(){
        app.launch()
        let cellQuery = self.app.tables.cells.element(boundBy: 3)
        cellQuery.tap()
        XCTAssertTrue(app.isUserInfoScreen)
        app.navigationBars["Nestaway.UserInfoView"].buttons["Search Tweets"].tap()
        XCTAssertTrue(app.isDisplayingSearchView)
        
    }
    
    
    
}
