//
//  NearbyViewController.swift
//  BallFriend
//
//  Created by sky on 10/27/14.
//  Copyright (c) 2014 sky. All rights reserved.
//

import UIKit

let QGstatusBarHeight = UIApplication.sharedApplication().statusBarFrame.height

let nearPersonTVTag = 101
let nearTeamTVTag = 102

let bundlePath = NSBundle.mainBundle().bundlePath   //手机沙盒的地址

class NearbyViewController: BaseViewController ,UITableViewDataSource,UITableViewDelegate{

    var nearPersonTV :UITableView? //附近球员列表
    var nearTeamTV:UITableView? //附近球队列表
    
    var perTvSelected:NSIndexPath?
    var teamTvSelected:NSIndexPath?
    
    var dataSource :Array<User>?
    
    override func viewDidLoad() {
        
    
        
        dataSource = UserManager().loadNearUserData()
        
        //导航栏的高度
        let QGNavigationBarHeight = self.navigationController!.navigationBar.frame.size.height
        //工具栏的高度
        let QGToolBarHeight = self.tabBarController!.tabBar.frame.height

        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.automaticallyAdjustsScrollViewInsets = false
        
        
        self.nearPersonTV = UITableView()
        self.nearTeamTV = UITableView()
        
        self.nearPersonTV!.delegate = self
        self.nearPersonTV!.dataSource = self
        self.nearTeamTV!.delegate = self
        self.nearTeamTV!.dataSource = self
        
        nearPersonTV!.tag = nearPersonTVTag
        nearTeamTV!.tag = nearTeamTVTag
        
        
        var twoVc = RootScrollView.shareInstance([self.nearPersonTV!,self.nearTeamTV!],frame:CGRectMake(0, QGNavigationBarHeight+QGstatusBarHeight+30, screenRect.size.width, Globle.shareInstance().globleAllHeight-QGNavigationBarHeight-QGstatusBarHeight-QGToolBarHeight))
        
        var twoTopVc = TopScrollView.shareInstance(["球员","球队"],frame:CGRectMake(0, QGNavigationBarHeight+QGstatusBarHeight, screenRect.size.width, 30))
        
        twoTopVc.normalTitleColor = UIColor.grayColor()
        twoTopVc.selectedTitleColor = UIColor.blueColor()
        twoTopVc.rootView = twoVc
        twoVc.topView = twoTopVc
        twoTopVc.initWithNameButtons()
        
        self.view.addSubview(twoTopVc)
        self.view.addSubview(twoVc)
        
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

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataSource!.count;
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        if tableView.tag == nearPersonTVTag {
            
        var cell:NearPersonTVCell? = tableView.dequeueReusableCellWithIdentifier("cell") as? NearPersonTVCell
        
        if cell == nil{
           cell =  NearPersonTVCell(style:.Default, reuseIdentifier: "cell")
            var button: UIButton = UIButton.buttonWithType(.ContactAdd) as UIButton
            button.frame = CGRectMake(screenRect.width-40,30,30 ,30);
            cell!.addSubview(button as UIButton)
            
        }
        
        cell!.avatarImage!.image = UIImage(contentsOfFile: dataSource![indexPath.row].avatar)//人物头像
            
        cell!.nameLabel!.text = dataSource![indexPath.row].name//设置队员姓名
        cell!.distanceLabel!.text = "288km" //设置队员距离用户的大概距离
        cell!.reputationRating = Int(dataSource![indexPath.row].honorrank)//队员的信誉等级
        cell!.setreputationRating()//设置信誉等级
        cell!.setBelongedTeam(["会飞的球","爱运动不解释"])//设置加入的球队
        cell!.setSex(Int(dataSource![indexPath.row].sex))//设置队员性别
        cell!.setActivity(Int(dataSource![indexPath.row].activity))//设置队员活跃度
        cell!.setTeamStyle(1)
            return cell!;
            
        } else if tableView.tag == nearTeamTVTag{
            
            var cell:NearPersonTVCell? = tableView.dequeueReusableCellWithIdentifier("cell") as? NearPersonTVCell
            
            if cell == nil{
                cell =  NearPersonTVCell(style:.Default, reuseIdentifier: "cell")
                var button: UIButton = UIButton.buttonWithType(.ContactAdd) as UIButton
                button.frame = CGRectMake(screenRect.width-40,20,30 ,30);
                cell!.addSubview(button as UIButton)
                
            }
            
            cell!.nameLabel!.text = "会飞的球" //球队的队名
            cell!.distanceLabel!.text = "288km"//球队和用户的距离
            cell!.reputationRating = 3 //球队的信誉等级
            cell!.setreputationRating()//设置信誉等级
            cell!.setTeamStyle(3)//设置球队类型
            cell!.setActivity(1)//设置球队活跃度
            return cell!;
        }
        
        return UITableViewCell()
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        if tableView.tag == nearPersonTVTag{
        return 90.0
        }
        else{
         return 75.0
        }
        
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if tableView.tag == nearPersonTVTag{
        var perIn = PersonInformationVC()
        perIn.dataSource = dataSource![indexPath.row];
        
        self.navigationController!.pushViewController(perIn, animated: true)
        perTvSelected = indexPath
        }
    }
    
     override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        nearPersonTV!.deselectRowAtIndexPath(perTvSelected!, animated: true)
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController!.tabBar.hidden = false
        self.navigationController!.toolbar.hidden = true

    }
    
}
