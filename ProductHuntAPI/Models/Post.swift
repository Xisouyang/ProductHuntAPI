//
//  Post.swift
//  ProductHuntAPI
//
//  Created by Stephen Ouyang on 2/16/19.
//  Copyright © 2019 Stephen Ouyang. All rights reserved.
//

import UIKit

// A product retrieved from the Product Hunt API.

struct Post {
    let id: Int
    let name: String
    let tagline: String
    let votesCount: Int
    let commentsCount: Int
}
