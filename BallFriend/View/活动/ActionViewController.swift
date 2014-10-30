//
//  ActionViewController.swift
//  BallFriend
//
//  Created by sky on 10/27/14.
//  Copyright (c) 2014 sky. All rights reserved.
//

import UIKit

class ActionViewController: BaseViewController {

    var myActionTV:UITableView?
    var footActionTV:UITableView?
    var basketActionTV:UITableView?
    var badmintonActionTV:UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //导航栏的高度
        let QGNavigationBarHeight = self.navigationController!.navigationBar.frame.size.height
        //工具栏的高度
        let QGToolBarHeight = self.tabBarController!.tabBar.frame.height
        
        myActionTV = UITableView();
        footActionTV = UITableView();
        basketActionTV = UITableView();
        badmintonActionTV = UITableView();
        
        footActionTV!.backgroundColor = UIColor.greenColor()
        badmintonActionTV!.backgroundColor = UIColor.blueColor()
        
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.backgroundColor = UIColor.whiteColor()
        
        let TVs = [myActionTV!,footActionTV!,basketActionTV!,badmintonActionTV!];
        
        var twoVc = RootScrollView.shareInstance(TVs,frame:CGRectMake(0, QGNavigationBarHeight+QGstatusBarHeight+30, screenRect.size.width, Globle.shareInstance().globleAllHeight-QGNavigationBarHeight-QGstatusBarHeight-QGToolBarHeight))
        
        var twoTopVc = TopScrollView.shareInstance(["我的","足球","篮球","羽毛球"],frame:CGRectMake(0, QGNavigationBarHeight+QGstatusBarHeight, screenRect.size.width, 30))
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
