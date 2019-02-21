//
//  CommentsViewController.swift
//  ProductHuntAPI
//
//  Created by Stephen Ouyang on 2/20/19.
//  Copyright © 2019 Stephen Ouyang. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var comments: [Comment]! = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var postID: Int!
    let tableView = UITableView()
    var networkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
        updateComments()

        // Do any additional setup after loading the view.
    }
    
    func setupTableView() {
        tableView.register(CommentCell.self, forCellReuseIdentifier: "commentCell")
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        CommentsTableViewConstraints()
    }
    
    func updateComments() {
        networkManager.getComments(postID) { result in
            switch result {
            case let .success(comments):
                self.comments = comments
            case let .failure(error):
                print(error)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
