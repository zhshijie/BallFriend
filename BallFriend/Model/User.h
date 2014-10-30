//
//  User.h
//  BallFriend
//
//  Created by sky on 10/29/14.
//  Copyright (c) 2014 sky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSNumber * activity;
@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSString * avatar;
@property (nonatomic, retain) NSNumber * ball_age;
@property (nonatomic, retain) NSNumber * height;
@property (nonatomic, retain) NSNumber * honorrank;
@property (nonatomic, retain) NSNumber * is_secret;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) NSNumber * sex;
@property (nonatomic, retain) NSString * signature;
@property (nonatomic, retain) NSNumber * userId;
@property (nonatomic, retain) NSNumber * weight;
@property (nonatomic, retain) NSNumber * specilalized;
@property (nonatomic, retain) NSNumber * latitude;

@end
