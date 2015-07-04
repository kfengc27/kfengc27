//
//  StoryTableViewCell.swift
//  DNApp
//
//  Created by kfengc27 on 15/7/3.
//  Copyright (c) 2015年 Meng To. All rights reserved.
//

import UIKit

protocol StoryTableViewCellDelegate:class{
    
    func storyTableViewCellDidTouchUpvote(cell:StoryTableViewCell,sender:AnyObject)
    func storyTableViewCellDidTouchComment(cell:StoryTableViewCell,sender:AnyObject)
    
}




class StoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var badgeImageView: UIImageView!

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    
    @IBOutlet weak var authorLabel: UILabel!

    @IBOutlet weak var upvoteButton: SpringButton!
    
    @IBOutlet weak var commentButton: SpringButton!
    
    @IBOutlet weak var commentTextView: AutoTextView!
    
    
    weak var delegate:StoryTableViewCellDelegate?
    
    
    @IBAction func upvoteButtonDidTouch(sender: AnyObject) {
        upvoteButton.animation="pop"
        upvoteButton.force=3
        upvoteButton.animate()
        
        delegate?.storyTableViewCellDidTouchUpvote(self, sender: sender)
        
    }
    
    
    @IBAction func commentButtonDidTouch(sender: AnyObject) {
        commentButton.animation="pop"
        commentButton.force=3
        commentButton.animate()
        delegate?.storyTableViewCellDidTouchComment(self, sender: sender)
    }
    
    
    func configureWithStory(story:JSON){
       
        let title = story["title"].string!
        let badge = story["badge"].string!
        let userPortraitUrl = story["user_portrait_url"].string!
        let userDisplayName = story["user_display_name"].string!
        let userJob = story["user_job"].string!
        let createdAt = story["created_at"].string!
        let voteCount = story["vote_count"].int!
        let commentCount = story["comment_count"].int!
        let comment=story["comment"].string!
        
//        if let commentTextView =commentTextView {
//            commentTextView.text = comment
//        }
        

        
        titleLabel.text=title
        badgeImageView.image = UIImage(named: "badge-" + badge)
        avatarImage.image=UIImage(named: "content-avatar-default")
        authorLabel.text = userDisplayName + ", " + userJob
        timeLabel.text = timeAgoSinceDate(dateFromString(createdAt, "yyyy-MM-dd'T'HH:mm:ssZ"), true)
        upvoteButton.setTitle(toString(voteCount), forState: UIControlState.Normal)
    commentButton.setTitle(toString(commentCount), forState: UIControlState.Normal)
        
        
        if let commentTextView = commentTextView {
            commentTextView.text = comment
        }
        

}

}