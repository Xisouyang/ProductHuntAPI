//
//  CommentCell.swift
//  ProductHuntAPI
//
//  Created by Stephen Ouyang on 2/20/19.
//  Copyright © 2019 Stephen Ouyang. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {
    
    let commentsTextView: UITextView = {
        var commentsTextView = UITextView()
        commentsTextView.isEditable = false
        return commentsTextView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(commentsTextView)
        commentCellConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
