//
//  UserInfoViewController.swift
//  Nestaway
//
//  Created by Ashiq Sulaiman on 21/02/18.
//  Copyright © 2018 Ashiq Sulaiman. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class UserInfoViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var friendsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    let searchViewModel = SearchViewModel()
    let disposeBag = DisposeBag()
    var index: Int?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateUserInfo()
    }
    

    private func populateUserInfo(){
         searchViewModel.getTweets().asObservable()
            .subscribe(onNext: { (tweet) in
                print(tweet.count)
                guard let selectedIndex = self.index else { return }
                let userInfo = tweet[selectedIndex]
                self.nameLabel.text        = userInfo.name
                self.screenNameLabel.text  = userInfo.screenName
                self.followersLabel.text   = userInfo.followersCount
                self.friendsLabel.text     = userInfo.friendsCount
                self.locationLabel.text    = userInfo.location
                self.descriptionLabel.text = userInfo.userDescription
            }) .disposed(by: disposeBag)
    }
    
    

}
