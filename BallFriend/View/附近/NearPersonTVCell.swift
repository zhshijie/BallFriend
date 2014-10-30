//
//  NearPersonTVCell.swift
//  BallFriend
//
//  Created by sky on 10/27/14.
//  Copyright (c) 2014 sky. All rights reserved.
//

import UIKit

class NearPersonTVCell: UITableViewCell {
    
    var avatarImage:UIImageView?//用户头像
    var nameLabel:UILabel? //用户姓名
    var distanceLabel:UILabel? //与但前用户的距离
    var activityImage:UIImageView? //用户的活跃图像
    var sexImage:UIImageView? //性别图像
    var reputationRating:Int?//信誉等级
//    var belongedTeam:Array<>? //加入的球队
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        avatarImage = UIImageView(frame: CGRectMake(15, 15, 50, 50))
        self.addSubview(avatarImage!)
        
        nameLabel = UILabel(frame: CGRectMake(90, 15, 100, 15));
        nameLabel!.font = UIFont.systemFontOfSize(14)
        self.addSubview(nameLabel!)
        
        
        activityImage = UIImageView(frame: CGRectMake(70, 45, 15, 15))
        activityImage!.backgroundColor  = UIColor.blueColor()
        self.addSubview(activityImage!)
        var activityLable = UILabel(frame: CGRectMake(90, 45, 50, 15))
        activityLable.text = "活跃度"
        activityLable.font = UIFont.boldSystemFontOfSize(11)
        activityLable.textColor = UIColor.grayColor()
        self.addSubview(activityLable)
        
        var distanceImage = UIImageView(frame: CGRectMake(140, 45, 15, 15))
        distanceImage.backgroundColor = UIColor.greenColor()
        self.addSubview(distanceImage)
        
        distanceLabel = UILabel(frame: CGRectMake(160, 45, 50, 15))
        distanceLabel!.font = UIFont.systemFontOfSize(11)
        distanceLabel!.textColor = UIColor.grayColor()
        self.addSubview(distanceLabel!)
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //设置信誉等级
     func setreputationRating()
    {
        var i:Int = 0
        while reputationRating > i
        {
            let  img = UIImageView(image: UIImage(named: ""))
            img.backgroundColor = UIColor.blackColor()
            img.frame = CGRectMake(CGFloat(70+i*13), 31, 11, 11)
            i = i+1;
            self.addSubview(img)
        }
    }
    
    //设置加入的球队
    func setBelongedTeam(teams:Array<AnyObject>){
        
        var i:CGFloat = 0
        while teams.count > Int(i)
        {
            let  img = UIImageView(image: UIImage(named: ""))
            img.backgroundColor = UIColor.blackColor()
            img.frame = CGRectMake(70.0 , 62+12*i , 11, 11)
            self.addSubview(img)
            
            let lable = UILabel(frame: CGRectMake(83, 62+12*i, 100, 11))
            lable.font = UIFont.systemFontOfSize(11)
            lable.text = teams[Int(i)] as? String
            self.addSubview(lable)
             i = i+1;
        }
    }
    
    
    //设置性别
    func setSex(sex:Int)
    {
        let size = nameLabel!.sizeThatFits(CGSizeMake(100, 15))
        let newRect = CGRectMake(90, 15, size.width, size.height)
        nameLabel!.frame = newRect
        
        sexImage = UIImageView(frame: CGRectMake(90+size.width+2, 15, 13, 13))
        sexImage!.backgroundColor = UIColor.orangeColor()
        self.addSubview(sexImage!);
    }
    
    //设置球队类型
    func setTeamStyle(style:Int)
    {
        var teamStyle = UIImageView(frame: CGRectMake(70, 15, 15, 15))
        teamStyle.backgroundColor = UIColor.purpleColor()
        self.addSubview(teamStyle)
    }
    
    //设置活跃度
    func setActivity(activity:Int)
    {
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
