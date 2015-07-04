//
//  StoriesTableViewController.swift
//  DNApp
//
//  Created by kfengc27 on 15/7/2.
//  Copyright (c) 2015年 Meng To. All rights reserved.
//

import UIKit

class StoriesTableViewController: UITableViewController, StoryTableViewCellDelegate {

   let transitionManager = TransitionManager()
    
    
    
    @IBAction func menuButtonDidTouch(sender: AnyObject) {
        performSegueWithIdentifier("MenuSegue", sender: self)
    
    
    }
    @IBAction func loginButtonDidTouch(sender: AnyObject) {
    
        performSegueWithIdentifier("LoginSegue", sender: self)
    
    
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCellWithIdentifier("StoryCell")as!StoryTableViewCell
        
        
        let story = data[indexPath.row]
        
        cell.configureWithStory(story)
    
        
        cell.delegate=self
        
        return cell
       
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("WebSegue", sender: indexPath)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension

    UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.Default, animated: true)
    
    
    
    }

    //MARK:StoryTableViewCellDelegate
    
    func storyTableViewCellDidTouchUpvote(cell: StoryTableViewCell, sender: AnyObject) {
        //TODO:Implement Upvote
    }
    
    
    func storyTableViewCellDidTouchComment(cell: StoryTableViewCell, sender: AnyObject) {
        performSegueWithIdentifier("CommentsSegue", sender: cell)
    }
    
    //MARK:Misc
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //TODO:待完善
        if segue.identifier=="CommentsSegue"{
            let toView=segue.destinationViewController as! CommentsTableViewController
            let indexPath = tableView.indexPathForCell(sender as!UITableViewCell)
            let story=data[indexPath!.row]
            toView.story=story
            
        }
        
        
        if segue.identifier == "WebSegue" {
            let toView = segue.destinationViewController as! WebViewController
            let indexPath = sender as! NSIndexPath
            let url = data[indexPath.row]["url"].string!
            toView.url = url
            
            UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: UIStatusBarAnimation.Fade)
            
            toView.transitioningDelegate = transitionManager
        }
        
        
        
    }
    
    
    
    

}
