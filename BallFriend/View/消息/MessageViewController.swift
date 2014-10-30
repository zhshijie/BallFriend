//
//  MessageViewController.swift
//  BallFriend
//
//  Created by sky on 10/27/14.
//  Copyright (c) 2014 sky. All rights reserved.
//

import UIKit

class MessageViewController: BaseViewController {

    var friendTV :UITableView? //附近球员列表
    var messageTV:UITableView? //附近球队列表
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //导航栏的高度
        let QGNavigationBarHeight = self.navigationController!.navigationBar.frame.size.height
        //工具栏的高度
        let QGToolBarHeight = self.tabBarController!.tabBar.frame.height
        
        super.viewDidLoad()
        self.friendTV = UITableView()
        self.messageTV = UITableView()
        self.messageTV!.backgroundColor = UIColor.redColor()
        
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.automaticallyAdjustsScrollViewInsets = false
        
        
        var twoVc = RootScrollView.shareInstance([self.messageTV!,self.friendTV!],frame:CGRectMake(0, QGNavigationBarHeight+QGstatusBarHeight+30, screenRect.size.width, Globle.shareInstance().globleAllHeight-QGNavigationBarHeight-QGstatusBarHeight-QGToolBarHeight))
        
        var twoTopVc = TopScrollView.shareInstance(["消息","好友"],frame:CGRectMake(0, QGNavigationBarHeight+QGstatusBarHeight, screenRect.size.width, 30))
        twoTopVc.normalTitleColor = UIColor.grayColor()
        twoTopVc.selectedTitleColor = UIColor.blueColor()
        twoTopVc.rootView = twoVc
        twoVc.topView = twoTopVc
        twoTopVc.initWithNameButtons()
        
        self.view.addSubview(twoTopVc)
        self.view.addSubview(twoVc)
        

        // Do any additional setup after loading the view.
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
