//
//  PostTableViewCell.swift
//  RedditObjcProject
//
//  Created by Junior Suarez-Leyva on 5/7/20.
//  Copyright © 2020 Junior Suarez-Leyva. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var upCountLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    
    var post: DVMPost? {
        didSet {
            
        }
    }
    
    var thumbnail: UIImage? {
        didSet{
            updateViews()
        }
    }
   
    
    func updateViews() {
        guard let post = post else {return }
        userNameLabel.text = "User name: \(post.user) 👨‍🦲"
        titleLabel.text = post.title
        thumbnailImageView.image = thumbnail
        upCountLabel.text = "\(post.ups) 💛"
        commentCountLabel.text = "\(post.commentCount) 💬"
        
    }
}
