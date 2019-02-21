//
//  ViewController.swift
//  ProductHuntAPI
//
//  Created by Stephen Ouyang on 1/29/19.
//  Copyright © 2019 Stephen Ouyang. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
//    var mockData: [Post] = {
//        var meTube = Post(id: 0, name: "MeTube", tagline: "Stream videos for free!", votesCount: 25, commentsCount: 4)
//        var boogle = Post(id: 1, name: "Boogle", tagline: "Search anything!", votesCount: 1000, commentsCount: 50)
//        var meTunes = Post(id: 2, name: "meTunes", tagline: "Listen to any song!", votesCount: 25000, commentsCount: 590)
//        
//        return [meTube, boogle, meTunes]
//    }()
    var networkManager = NetworkManager()
    var posts: [Post] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setupTableView()
        updateFeed()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupNav() {
        navigationItem.title = "Feed"
        navigationController?.navigationBar.backgroundColor = .gray
        self.view.backgroundColor = .white
    }
    
    func setupTableView() {
        tableView.register(PostCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        feedTableViewConstraints()
    }
    
    func updateFeed() {
        networkManager.getPosts() { result in
            self.posts = result
        }
    }
}

