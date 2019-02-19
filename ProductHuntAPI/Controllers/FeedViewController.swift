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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setupTableView()
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
        tableViewConstraints()
    }
}

