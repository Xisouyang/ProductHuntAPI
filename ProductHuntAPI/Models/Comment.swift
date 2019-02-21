//
//  Comment.swift
//  ProductHuntAPI
//
//  Created by Stephen Ouyang on 2/21/19.
//  Copyright © 2019 Stephen Ouyang. All rights reserved.
//

import UIKit

struct Comment: Decodable {
    let id: Int
    let body: String
}

struct CommentAPIResponse: Decodable {
    let comments: [Comment]
}
