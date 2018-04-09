//
//  XCUIApplication+UserInfo.swift
//  NestawayUITests
//
//  Created by Ashiq Sulaiman on 26/02/18.
//  Copyright © 2018 Ashiq Sulaiman. All rights reserved.
//

import XCTest

extension XCUIApplication {
    var isUserInfoScreen: Bool{
        return otherElements["userInfoView"].exists
    }
}
