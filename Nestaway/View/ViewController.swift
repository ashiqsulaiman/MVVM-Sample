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
    var tweet: String?
    var selectedIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetListTableView.rowHeight = 100
        populateTweetListTableView()
        setupDidSelectItemForTweetListTableView()
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
    
    func setupDidSelectItemForTweetListTableView(){
        tweetListTableView.rx.itemSelected
            .subscribe(onNext: { indexPath in
                self.tweetListTableView.deselectRow(at: indexPath, animated: false)
                self.selectedIndex = indexPath.item
                self.performSegue(withIdentifier: "userInfoSegue", sender: self)
            })
            .disposed(by: disposeBag)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "userInfoSegue" {
            guard let destinationVC = segue.destination as? UserInfoViewController else { return }
            destinationVC.index = selectedIndex            
        }
    }
        
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        searchViewModel.searchTweet(tweet: searchText)
        searchBar.endEditing(true)
    }
    

}



