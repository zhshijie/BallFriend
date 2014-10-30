//
//  ManageViewController.swift
//  BallFriend
//
//  Created by sky on 10/27/14.
//  Copyright (c) 2014 sky. All rights reserved.
//

import UIKit

class ManageViewController: BaseViewController {

    var memberTV:UITableView?
    var notiTV:UITableView?
    var actionTV:UITableView?
    var traingTV:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //导航栏的高度
        let QGNavigationBarHeight = self.navigationController!.navigationBar.frame.size.height
        //工具栏的高度
        let QGToolBarHeight = self.tabBarController!.tabBar.frame.height
        
        let headViewHeight = screenRect.height/4
        self.memberTV = UITableView();
        self.notiTV = UITableView();
        self.actionTV = UITableView();
        self.traingTV = UITableView();
        
        traingTV!.backgroundColor = UIColor.greenColor()
        notiTV!.backgroundColor = UIColor.blueColor()
        
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.backgroundColor = UIColor.whiteColor()
        
        let TVs = [memberTV!,notiTV!,actionTV!,traingTV!];
        
        var twoVc = RootScrollView.shareInstance(TVs,frame:CGRectMake(0, QGNavigationBarHeight+QGstatusBarHeight+30+headViewHeight, screenRect.size.width, Globle.shareInstance().globleAllHeight-QGNavigationBarHeight-QGstatusBarHeight-44-headViewHeight))
        
        var twoTopVc = TopScrollView.shareInstance(["球员","通知","活动","训练"],frame:CGRectMake(0, QGNavigationBarHeight+QGstatusBarHeight+headViewHeight, screenRect.size.width, 30))
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
