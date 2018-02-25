//
//  SearchViewModel.swift
//  Nestaway
//
//  Created by Ashiq Sulaiman on 20/02/18.
//  Copyright © 2018 Ashiq Sulaiman. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import CoreData
import Alamofire

struct SearchViewModel {
    private var tweets = Variable<[Tweet]>([])
    private var tweetDataAccessProvider = TweetDataAccessProvider()
    private var disposeBag = DisposeBag()
    private var network = Network()
    
    init() {
        fetchTweetsAndUpdateObservableTweets()
    }
    
    public func getTweets() -> Variable<[Tweet]> {
        return tweets
    }
    
    // MARK: - fetching Tweets from Core Data and update observable tweets
    private func fetchTweetsAndUpdateObservableTweets() {
        tweetDataAccessProvider.fetchObservableData()
            .subscribe(onNext : { (tweet) in
                self.tweets.value = tweet
            })
            .disposed(by: disposeBag)
    }
    
    public func searchTweet(tweet: String){
        network.searchTweet(tweet: tweet) { (data) in
            guard let JSONData = data else { return }
            self.tweetDataAccessProvider.addTweet(withTweet: JSONData)
        }
    }
    

}
