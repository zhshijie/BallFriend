//
//  PersonInformationVC.swift
//  BallFriend
//
//  Created by sky on 10/28/14.
//  Copyright (c) 2014 sky. All rights reserved.
//

import UIKit

class PersonInformationVC: BaseViewController,UITableViewDelegate,UITableViewDataSource{

    
    var tableView:UITableView?
    var dataSource:User?
    var avaIg:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController!.tabBar.hidden = true
        self.navigationController!.toolbar.hidden = false
        self.view.backgroundColor = UIColor.whiteColor()
        //导航栏的高度
        let QGNavigationBarHeight = self.navigationController!.navigationBar.frame.size.height
        //工具栏的高度
        let QGToolBarHeight = self.tabBarController!.tabBar.frame.height

        
        tableView = UITableView(frame: CGRectMake(0, 0, screenRect.width, screenRect.height-QGToolBarHeight+10), style: .Grouped)
        tableView!.delegate = self
        tableView!.dataSource = self
        
        self.view.addSubview(tableView!)
        
        self.title = dataSource!.name
        
        
        
        var senMessBT:UIButton = UIButton.buttonWithType(.System) as UIButton
        senMessBT.frame = CGRectMake(0, screenRect.height-QGToolBarHeight+10, screenRect.width/2, QGToolBarHeight-10)
        senMessBT.setTitle("发消息", forState:.Normal)
        senMessBT.titleLabel!.font = UIFont.systemFontOfSize(13)
        senMessBT.titleLabel!.textAlignment = .Center
        senMessBT.setTitleColor(UIColor.grayColor(), forState: .Normal)
//        senMessBT.layer.borderWidth = 0.3
//        senMessBT.layer.borderColor = UIColor.grayColor().CGColor
        self.view.addSubview(senMessBT)
        
        
        var addFriBT:UIButton = UIButton.buttonWithType(.System) as UIButton
        addFriBT.frame = CGRectMake(screenRect.width/2, screenRect.height-QGToolBarHeight+10, screenRect.width/2, QGToolBarHeight-10)
        addFriBT.setTitle("加好友", forState: .Normal)
        addFriBT.setTitleColor(UIColor.grayColor(), forState: .Normal)
        addFriBT.titleLabel!.textAlignment = .Center

        addFriBT.titleLabel!.font = UIFont.systemFontOfSize(13)
//        addFriBT.layer.borderWidth = 0.3
//        addFriBT.layer.borderColor = UIColor.grayColor().CGColor
        self.view.addSubview(addFriBT)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section==0
        {
            return 2
        }else{
            return 3
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
      
        var cell:UITableViewCell? = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        
        if indexPath.section==0
        {
            if indexPath.row == 0{
            var ageLB = UILabel(frame: CGRectMake(20, 0, 50, 44))
                ageLB.font = UIFont.systemFontOfSize(12)
                ageLB.text = "年龄  \(dataSource!.age)"
            
            var ballAgeLB = UILabel(frame: CGRectMake(100, 0, 50, 44))
                ballAgeLB.font = UIFont.systemFontOfSize(12)
                ballAgeLB.text = " 球龄  \(dataSource!.ball_age)"
            
            var hWeLabel = UILabel(frame: CGRectMake(200, 0, 100, 44))
                hWeLabel.font = UIFont.systemFontOfSize(12)
            if dataSource!.is_secret == 0
            {
                hWeLabel.text = "身高/体重 \(dataSource!.height)/\(dataSource!.weight)"
            }else{
                hWeLabel.text = "身高/体重  保密"
            }
            
            cell!.contentView.addSubview(ageLB)
            cell!.contentView.addSubview(ballAgeLB)
            cell!.contentView.addSubview(hWeLabel)
            }
            if indexPath.row == 1
            {
                var signatureLB = UILabel(frame: CGRectMake(20, 0, screenRect.width/4, 44))
                signatureLB.font = UIFont.systemFontOfSize(12)
                signatureLB.text = "个性签名"
                signatureLB.textColor = UIColor.grayColor()
                cell!.contentView.addSubview(signatureLB)
                
                var signatureLB2 = UILabel(frame: CGRectMake(screenRect.width/4, 0, screenRect.width-screenRect.width/4, 44))
                signatureLB2.font = UIFont.systemFontOfSize(12)
                signatureLB2.text = dataSource!.signature
                cell!.contentView.addSubview(signatureLB2)
            }
            
        }
        return cell!;
    }
  
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3;
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
        var headView = UIView()
        headView.frame = CGRectMake(0, 0, screenRect.width, 150)
        headView.backgroundColor = UIColor.greenColor()
            
        //  设置头像
        var avaImageV = UIImageView(frame: CGRectMake(20, 50, 60, 60))
            avaImageV.layer.cornerRadius = 30
            avaImageV.layer.masksToBounds = true
            avaImageV.backgroundColor = UIColor.whiteColor()
            headView.addSubview(avaImageV)
            //加载头像
            avaIg = UIImage(contentsOfFile: dataSource!.avatar)
            avaImageV.image = avaIg
        
        //设置活跃度
        var actiIg = UIImageView(frame: CGRectMake(85, 65, 15, 15))
            actiIg.backgroundColor = UIColor.whiteColor()
            headView.addSubview(actiIg)
        var actiLB = UILabel(frame: CGRectMake(105, 65, 30, 15))
            actiLB.text = "活跃度"
            actiLB.textColor = UIColor.grayColor()
            actiLB.font = UIFont.systemFontOfSize(10)
            headView.addSubview(actiLB)
            
            
        //设置信誉度
            var i:CGFloat = 0
            while Int(dataSource!.honorrank) > Int(i)
            {
                let  img = UIImageView(image: UIImage(named: ""))
                img.backgroundColor = UIColor.blackColor()
                img.frame = CGRectMake(85 + i*13, 83, 11, 11)
                i = i+1;
                headView.addSubview(img)
            }
            
            //设置地址
            var addressLB = UILabel(frame: CGRectMake(85,98, 30, 15))
            addressLB.text = dataSource!.address
            addressLB.textColor = UIColor.grayColor()
            addressLB.font = UIFont.systemFontOfSize(12)
            headView.addSubview(addressLB)
            
            let size = addressLB.sizeThatFits(CGSizeMake(100, 15))
            let newRect = CGRectMake(85, 98, size.width, size.height)
            addressLB.frame = newRect
            
            
            //设置性别
            let  seximg = UIImageView(image: UIImage(named: ""))
            seximg.backgroundColor = UIColor.blackColor()
            seximg.frame = CGRectMake(85+size.width+3, 100, 11, 11)
            headView.addSubview(seximg)
            
            
            
            let likeSport = UIImageView(frame: CGRectMake(CGFloat(screenRect.width*0.85), 0, 20, 25))
            likeSport.backgroundColor = UIColor.purpleColor()
            headView.addSubview(likeSport)
        return headView
        }
        else {
            var headView = UIView()
            headView.frame = CGRectMake(0, 0, screenRect.width, 20)
            var lable = UILabel(frame: CGRectMake(20, 0, screenRect.width, 20))
            lable.textAlignment = .Left
            lable.font  = UIFont.systemFontOfSize(13)
            lable.textColor = UIColor.grayColor()
            if section==1
            {
                lable.text = "所属球队"
            }else {
                lable.text = "最近活动"
            }
            headView.addSubview(lable)
            return headView
        }
    }
    
   
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        if section == 0
        {
            return 150
        }else{
            return 20
        }
    }

}
