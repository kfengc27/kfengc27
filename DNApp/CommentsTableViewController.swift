//
//  CommentsTableViewController.swift
//  DNApp
//
//  Created by kfengc27 on 15/7/4.
//  Copyright (c) 2015年 Meng To. All rights reserved.
//

import UIKit

class CommentsTableViewController: UITableViewController {

    
    
    var story:JSON!
    var comments:JSON!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        comments=story["Connents"]
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count+1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = indexPath.row == 0 ? "StoryCell" : "CommentCell"
        let cell=tableView.dequeueReusableCellWithIdentifier(identifier)as! UITableViewCell
        if let storyCell=cell as? StoryTableViewCell{
            storyCell.configureWithStory(story)

        }
        
        if let commentCell=cell as? CommentTableViewCell{
            let comment=comments[indexPath.row-1]
            commentCell.configureWithComment(comment)
      
        }
        return cell
    }
    
}
