//
//  ViewController.swift
//  Nestaway
//
//  Created by Ashiq Sulaiman on 19/02/18.
//  Copyright © 2018 Ashiq Sulaiman. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tweetListTableView: UITableView!
    
    var searchViewModel = SearchViewModel()
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
      //searchViewModel.addTweet()
      populateTweetListTableView()
        
    }
    
    
    // MARK: - perform a binding from observableTweet from ViewModel to tweetListTableView
    private func populateTweetListTableView() {
        let observableTweets = searchViewModel.getTweets().asObservable()
        
        observableTweets.bind(to: tweetListTableView.rx.items(cellIdentifier: "tweetCell", cellType: TweetListTableViewCell.self)) { (row, element, cell) in
            
            cell.tweetLabel.text = element.tweet
            }
            .disposed(by: disposeBag)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
    
    

}



