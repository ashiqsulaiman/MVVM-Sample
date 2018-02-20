//
//  Network.swift
//  Nestaway
//
//  Created by Ashiq Sulaiman on 20/02/18.
//  Copyright © 2018 Ashiq Sulaiman. All rights reserved.
//

import Foundation

enum Network {
    case bearerToken
    case limit
    case baseURL
    
    var stringValue: String {
        switch self {
        case .baseURL: return "https://api.twitter.com/1.1/search/tweets.json?q="
        case .bearerToken: return "Bearer AAAAAAAAAAAAAAAAAAAAACqI2gAAAAAAxR0nG4lBcnKW%2BuXoyfg4r9j3ISg%3DeT8hqjYEneYWvhZtNRKo02djUcHBpYXCoa7AF1KVblo35uj233"
        case .limit: return "&count=10"
        }
    }
    
}



