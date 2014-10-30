//
//  Globle.h
//  SlideSwitchDemo
//
//  Created by liulian on 13-4-23.
//  Copyright (c) 2013年 liulian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Globle : NSObject

@property (nonatomic,assign) CGFloat globleWidth;
@property (nonatomic,assign) CGFloat globleHeight;
@property (nonatomic,assign) CGFloat globleAllHeight;

+ (Globle *)shareInstance;
+ (UIColor *)colorFromHexRGB:(NSString *)inColorString;

@end
