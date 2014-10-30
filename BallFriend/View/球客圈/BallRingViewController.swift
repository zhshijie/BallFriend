//
//  BallRingViewController.swift
//  BallFriend
//
//  Created by sky on 10/27/14.
//  Copyright (c) 2014 sky. All rights reserved.
//

import UIKit

class BallRingViewController: BaseViewController {

    var tableView:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false

        self.view.backgroundColor = UIColor.whiteColor()
        //导航栏的高度
        let QGNavigationBarHeight = self.navigationController!.navigationBar.frame.size.height
        //工具栏的高度
        let QGToolBarHeight = self.tabBarController!.tabBar.frame.height

        tableView = UITableView()
        tableView!.frame = CGRectMake(0, QGNavigationBarHeight+QGstatusBarHeight, screenRect.width, screenRect.height-QGNavigationBarHeight-QGToolBarHeight-QGstatusBarHeight);
        
        self.view.addSubview(tableView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
