//
//  PostCell+Constraints.swift
//  ProductHuntAPI
//
//  Created by Stephen Ouyang on 2/18/19.
//  Copyright © 2019 Stephen Ouyang. All rights reserved.
//

import UIKit

extension PostCell {
    
    func containerConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor).isActive = true
    }
    
    func nameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        
    }
    
    func stackViewConstraints() {
        commentVoteStackView.translatesAutoresizingMaskIntoConstraints = false
        commentVoteStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        commentVoteStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
    }
    
    func taglineConstraints() {
        taglineLabel.translatesAutoresizingMaskIntoConstraints = false
        taglineLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        taglineLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        taglineLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    }
    
    func imageConstraints() {
        previewImageView.translatesAutoresizingMaskIntoConstraints = false
        previewImageView.widthAnchor.constraint(equalToConstant: 359).isActive = true
        previewImageView.heightAnchor.constraint(equalToConstant: 186).isActive = true
        previewImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        previewImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}
