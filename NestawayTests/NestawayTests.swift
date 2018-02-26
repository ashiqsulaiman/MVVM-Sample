//
//  NestawayTests.swift
//  NestawayTests
//
//  Created by Ashiq Sulaiman on 24/02/18.
//  Copyright © 2018 Ashiq Sulaiman. All rights reserved.
//

import XCTest
import Alamofire
import SwiftyJSON
import UIKit
@testable import Nestaway

class NestawayTests: XCTestCase {
    
    let network = Network()

    override func setUp() {
        super.setUp()
        //Anything that has to be setup before the test happens will be done here
        //called before every test
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // vice-versa of set up
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        // Runs the test multiple times and gives the average time for executing the function
        // Useful when the code is refractored and identifies if the new syntax takes a longer duration to complete
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    //Test if the data returned from the api is nil
    func testsearchTweet(){
        let expectationForAsync = expectation(description: "fetches the tweet from the backend and runs the closure")
        let tweet = "India"
        network.searchTweet(tweet: tweet) { (responseData) in
            guard let data = responseData else { return }
            XCTAssertNotNil(data)
            expectationForAsync.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
}
