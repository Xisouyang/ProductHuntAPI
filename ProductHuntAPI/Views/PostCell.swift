//
//  PostCell.swift
//  ProductHuntAPI
//
//  Created by Stephen Ouyang on 2/16/19.
//  Copyright © 2019 Stephen Ouyang. All rights reserved.


/* Create custom cell for tableview
 Need 4 labels: name, tagline, number of votes, comments
 Use closures to create views for the labels
 
 
 ** The problem is setting the frame **
Have tried using contentView as an anchor object, but does not get correct height and width
 from the contentView frame
 
 //        containerView.translatesAutoresizingMaskIntoConstraints = false
 //        containerView.widthAnchor.constraint(equalToConstant: contentView.accessibilityFrame.width).isActive = true
 //        containerView.heightAnchor.constraint(equalToConstant: contentView.accessibilityFrame.height).isActive = true
 
 //        containerView.translatesAutoresizingMaskIntoConstraints = false
 //        containerView.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
 //        containerView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
 //        print(contentView.frame)
 
 Works when I hard code, but want to avoid doing that
 
 Don't know how to access the cell's frame - solved using contentView.addSubview()
 
 Now I don't know how to set constraints properly so that the name label won't overlap
 with the stackview.
 
 tried:  nameLabel.rightAnchor.constraint(equalTo: commentVoteStackView.leftAnchor, constant: 12).isActive = true
 nameLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 250), for: .horizontal)
 
 let horizontalConstraint = NSLayoutConstraint(item: nameLabel, attribute: .right, relatedBy: .equal, toItem: commentCountLabel, attribute: .left, multiplier: 1, constant: 12)
 NSLayoutConstraint.activate([horizontalConstraint])
 
 nameLabel.adjustsFontSizeToFitWidth = false
 nameLabel.lineBreakMode = NSLineBreakMode.byTruncatingTail
 
 nameLabel.rightAnchor.constraint(equalTo: commentVoteStackView.leftAnchor, constant: 12).isActive = true
 commentVoteStackView.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 12).isActive = true
 
*/

import UIKit

class PostCell: UITableViewCell {
    
    let containerView: UIView = {
        let containerView = UIView()
        return containerView
    }()
    
    let nameLabel: UILabel = {
        var nameLabel = UILabel()
        nameLabel.text = "Namenvdlnvskfvdvfvd"
        nameLabel.lineBreakMode = .byTruncatingTail
        return nameLabel
    }()
    
    let taglineLabel: UILabel = {
        var taglineLabel = UILabel()
        taglineLabel.text = "Tagline"
        taglineLabel.font = taglineLabel.font.withSize(12)
        return taglineLabel
    }()
    
    let commentCountLabel: UILabel = {
        var commentCountLabel = UILabel()
        commentCountLabel.text = "Comments: 0"
        commentCountLabel.font = commentCountLabel.font.withSize(12)
        return commentCountLabel
    }()
    
    let voteCountLabel: UILabel = {
        var voteCountLabel = UILabel()
        voteCountLabel.text = "Votes: 0"
        voteCountLabel.font = voteCountLabel.font.withSize(12)
        return voteCountLabel
    }()
    
    let commentVoteStackView: UIStackView = {
        let commentVoteStackView = UIStackView(arrangedSubviews: [])
        commentVoteStackView.axis = .horizontal
        commentVoteStackView.spacing = 8
        return commentVoteStackView
    }()
    
    let previewImageView: UIImageView = {
        var previewImageView = UIImageView()
        previewImageView.image = UIImage(named: "placeholder")
        return previewImageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        commentVoteStackView.addArrangedSubview(commentCountLabel)
        commentVoteStackView.addArrangedSubview(voteCountLabel)

        contentView.addSubview(containerView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(commentVoteStackView)
        contentView.addSubview(taglineLabel)
        contentView.addSubview(previewImageView)
        containerConstraints()
        nameLabelConstraints()
        stackViewConstraints()
        taglineConstraints()
        imageConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
