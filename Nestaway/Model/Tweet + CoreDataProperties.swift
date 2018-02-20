//
//  Tweet + CoreDataProperties.swift
//  Nestaway
//
//  Created by Ashiq Sulaiman on 20/02/18.
//  Copyright © 2018 Ashiq Sulaiman. All rights reserved.
//

import Foundation
import CoreData


extension Tweet {
    @NSManaged public var followersCount: String?
    @NSManaged public var friendsCount: String?
    @NSManaged public var screenName: String?
    @NSManaged public var name: String?
    @NSManaged public var location: String?
    @NSManaged public var userDescription: String?
    @NSManaged public var tweet: String?
    
    @nonobjc public class func tweetFetchRequest() -> NSFetchRequest<Tweet> {
        return NSFetchRequest<Tweet>(entityName: "Tweet")
    }
    
    
}
