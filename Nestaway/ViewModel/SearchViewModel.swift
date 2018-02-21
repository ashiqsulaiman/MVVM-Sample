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
    
    init() {
        fetchTweetsAndUpdateObservableTweets()
    }
    
    public func getTweets() -> Variable<[Tweet]> {
        return tweets
    }
    
    // MARK: - fetching Tweets from Core Data and update observable tweets
    private func fetchTweetsAndUpdateObservableTweets() {
        tweetDataAccessProvider.fetchObservableData()
            .map({ $0 })
            .subscribe(onNext : { (tweet) in
                self.tweets.value = tweet
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: -  search and store tweet
    public func searchTweet(tweet: String) {
        
        let urlString =  String(describing: Network.baseURL.stringValue+tweet+Network.limit.stringValue)
        let url = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        var request = URLRequest(url: URL(string: url!)!)
        request.httpMethod = "GET"
        request.setValue(Network.bearerToken.stringValue, forHTTPHeaderField: "Authorization")
        
        Alamofire.request(request).responseJSON { (response) in
            guard let data = response.data else {return}
            self.tweetDataAccessProvider.addTweet(withTweet: data)
        }
    }

}
