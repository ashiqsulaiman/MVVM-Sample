//
//  TweetDataAccessProvider.swift
//  Nestaway
//
//  Created by Ashiq Sulaiman on 20/02/18.
//  Copyright © 2018 Ashiq Sulaiman. All rights reserved.
//

import Foundation
import RxSwift
import CoreData
import SwiftyJSON

class TweetDataAccessProvider{
    private var tweetsFromCoreData = Variable<[Tweet]>([])
    private var managedObjectContext : NSManagedObjectContext
    
    init() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        tweetsFromCoreData.value = [Tweet]()
        managedObjectContext = delegate.persistentContainer.viewContext
        tweetsFromCoreData.value = fetchData()
    }
    
    // MARK: - fetching Tweets from Core Data and update observable tweets
    private func fetchData() -> [Tweet] {
        let tweetFetchRequest = Tweet.tweetFetchRequest()
        tweetFetchRequest.returnsObjectsAsFaults = false
        
        do {
            return try managedObjectContext.fetch(tweetFetchRequest)
        } catch {
            return []
        }
        
    }
    
    // MARK: - return observable tweet
    public func fetchObservableData() -> Observable<[Tweet]> {
        tweetsFromCoreData.value = fetchData()
        return tweetsFromCoreData.asObservable()
    }
    
    // MARK: - add new tweet to Core Data
    public func addTweet(withTweet tweets: Data) {
        let jsonResponse = JSON(tweets)["statuses"]
        for tweet in jsonResponse {
            let newTweet = NSEntityDescription.insertNewObject(forEntityName: "Tweet", into: managedObjectContext) as! Tweet
            newTweet.followersCount     = tweet.1["user"]["followers_count"].stringValue
            newTweet.friendsCount       = tweet.1["user"]["friends_count"].stringValue
            newTweet.screenName         = tweet.1["user"]["screen_name"].stringValue
            newTweet.name               = tweet.1["user"]["name"].stringValue
            newTweet.location           = tweet.1["user"]["location"].stringValue
            newTweet.userDescription    = tweet.1["user"]["description"].stringValue
            newTweet.tweet              = tweet.1["text"].stringValue
            
            do {
                try managedObjectContext.save()
                tweetsFromCoreData.value = fetchData()
            } catch {
                fatalError("error saving data")
            }
        }
        
        
    }
}
