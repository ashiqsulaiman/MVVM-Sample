//
//  NestawayTests.swift
//  NestawayTests
//
//  Created by Ashiq Sulaiman on 24/02/18.
//  Copyright © 2018 Ashiq Sulaiman. All rights reserved.
//

import XCTest
import Alamofire
@testable import Nestaway

class NestawayTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func testsearchTweet(){
        let tweet: String = "India"
        let urlString =  String(describing: NetworkApi.baseURL.stringValue+tweet+NetworkApi.limit.stringValue)
        let url = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        var request = URLRequest(url: URL(string: url!)!)
        request.httpMethod = "GET"
        request.setValue(NetworkApi.bearerToken.stringValue, forHTTPHeaderField: "Authorization")
        
        Alamofire.request(request).responseJSON { (response) in
            guard let response = response.result.value else { return }
            XCTAssertNotNil(response)
        }
    }
    
}
