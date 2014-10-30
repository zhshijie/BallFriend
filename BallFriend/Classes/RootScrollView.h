//
//  RootScrollView.h
//  SlideSwitchDemo
//
//  Created by liulian on 13-4-23.
//  Copyright (c) 2013年 liulian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopScrollView.h"
@interface RootScrollView : UIScrollView <UIScrollViewDelegate>
{
    NSArray *viewNameArray;
    CGFloat userContentOffsetX;
    BOOL isLeftScroll;
}
@property (nonatomic, retain) NSArray *viewNameArray;

@property (nonatomic,retain)TopScrollView *topView;
+ (RootScrollView *)shareInstance:(NSArray*)array frame:(CGRect)frame;

@end
