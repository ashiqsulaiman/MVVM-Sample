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


class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tweetListTableView: UITableView!
    
    var searchViewModel = SearchViewModel()
    var disposeBag = DisposeBag()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetListTableView.rowHeight = 100
        populateTweetListTableView()
        searchBar.delegate = self
        
        
    }
    
    
    // MARK: - perform a binding from observableTweet from ViewModel to tweetListTableView
    private func populateTweetListTableView() {
        let observableTweets = searchViewModel.getTweets().asObservable()
        
        observableTweets.bind(to: tweetListTableView.rx.items(cellIdentifier: "tweetCell", cellType: TweetListTableViewCell.self)) { (row, element, cell) in
            
            cell.tweetLabel.text = element.tweet
            }
            .disposed(by: disposeBag)
    }
    

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        searchViewModel.searchTweet(tweet: searchText)
        searchBar.endEditing(true)
    }
    

}



