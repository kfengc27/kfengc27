//
//  MenuViewController.swift
//  DNApp
//
//  Created by kfengc27 on 15/7/3.
//  Copyright (c) 2015年 Meng To. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    
    @IBOutlet weak var dialogView: DesignableView!
    
  
    @IBAction func closeButtonDidTouch(sender: AnyObject) {
        //TODO:来修改这里不能用的Close代码
        
        dismissViewControllerAnimated(true, completion: nil)
        dialogView.animation="fall"
        dialogView.animate()
        self.dismissViewControllerAnimated(true, completion: nil)

    
    }

}