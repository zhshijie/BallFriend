//
//  UserManager.swift
//  BallFriend
//
//  Created by sky on 10/29/14.
//  Copyright (c) 2014 sky. All rights reserved.
//

import UIKit

var appDele:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate

class UserManager: NSObject {
   
    
    func currentUser()->User{
        let entity = NSEntityDescription .entityForName("User", inManagedObjectContext: appDele.managedObjectContext!)
        var user = User(entity: entity!,insertIntoManagedObjectContext: appDele.managedObjectContext)
        
        return user
    }
    
    
    //加载附近用户
    func loadNearUserData()->Array<User>
    {
        var nearUsers = Array<User>()
        
        let entity = NSEntityDescription .entityForName("User", inManagedObjectContext: appDele.managedObjectContext!)
        var user = User(entity: entity!, insertIntoManagedObjectContext: appDele.managedObjectContext)
        user.name = "奔跑的小马甲"
        user.honorrank = 5
        user.address = "广州"
        user.signature = "自信飞扬，脚步飞快"
        user.avatar = bundlePath + "/contact.png"
        user.activity = 3
        user.age = 19
        user.height = 170
        user.weight  = 60
        user.is_secret = 0
        user.ball_age = 4
        
        nearUsers.append(user)
        
        return nearUsers
    }
    
    
    
}
