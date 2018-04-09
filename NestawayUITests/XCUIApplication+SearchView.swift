//
//  XCUIApplication+SearchView.swift
//  NestawayUITests
//
//  Created by Ashiq Sulaiman on 26/02/18.
//  Copyright © 2018 Ashiq Sulaiman. All rights reserved.
//

import XCTest

extension XCUIApplication {
    
    var isDisplayingSearchView: Bool {
        return otherElements["searchView"].exists
    }
    
    var isDisplayingSearchBar: Bool {
        return otherElements["searchBar"].exists
    }
    
    var isDisplayingTweetTableView: Bool{
        return otherElements["tweetTableView"].exists
    }
    
    
}
