//
//  LearnViewController.swift
//  DNApp
//
//  Created by kfengc27 on 15/7/2.
//  Copyright (c) 2015年 Meng To. All rights reserved.
//

import UIKit

class LearnViewController: UIViewController {

    @IBOutlet weak var dialogView: DesignableView!
    
    @IBOutlet weak var bookImageView: SpringImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        dialogView.animate()
        
    }
    
    
    @IBAction func learnButtonDidTouch(sender: AnyObject) {
        bookImageView.animation="pop"
        bookImageView.animate()

    }
    
    @IBAction func closeButtonDidTouch(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
          dialogView.animation="fall"
        dialogView.animateNext{
            self.dismissViewControllerAnimated(true, completion: nil)
        
        
        }
    }
    
    
    @IBAction func twitterButtonDidTouch(sender: AnyObject) {
        openURL("http://weibo.com/kfengc27")
    }

    
    @IBAction func learnsketchButtonDidTouch(sender: AnyObject) {
        
        openURL("http://v2ex.com")
    }
 
    
    
    func openURL(url:String){
        let targetURL=NSURL(string: url)
        UIApplication.sharedApplication().openURL(targetURL!)
    
        openURL("http://weibo.com/kfengc27")
        
    }
    
    
    
    
    
   }
