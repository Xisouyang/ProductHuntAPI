//
//  CommentCell+Constraints.swift
//  ProductHuntAPI
//
//  Created by Stephen Ouyang on 2/20/19.
//  Copyright © 2019 Stephen Ouyang. All rights reserved.
//

import UIKit

extension CommentCell {
    
    func commentCellConstraints() {
        commentsTextView.translatesAutoresizingMaskIntoConstraints = false
        commentsTextView.safeAreaLayoutGuide.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 15).isActive = true
        commentsTextView.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: 15).isActive = true
        commentsTextView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        commentsTextView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: 15).isActive = true
    }
}
