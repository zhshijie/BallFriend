//
//  RootScrollView.m
//  SlideSwitchDemo
//
//  Created by liulian on 13-4-23.
//  Copyright (c) 2013年 liulian. All rights reserved.
//

#import "RootScrollView.h"
#import "Globle.h"
#import "TopScrollView.h"

#define POSITIONID (int)scrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width

@implementation RootScrollView

@synthesize viewNameArray;

+ (RootScrollView *)shareInstance:(NSArray*)array frame:(CGRect)frame {
     RootScrollView *__singletion;
    __singletion=[[self alloc] initWithFrame:frame viewArray:array];
    return __singletion;
}

- (id)initWithFrame:(CGRect)frame viewArray:(NSArray *)array
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        
        self.viewNameArray = array;
        self.contentSize = CGSizeMake([Globle shareInstance].globleWidth*[viewNameArray count], 0);
        self.pagingEnabled = YES;
        self.userInteractionEnabled = YES;
        self.bounces = NO;
        
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        
        userContentOffsetX = 0;
        
        [self initWithViews];
    }
    return self;
}

- (void)initWithViews
{
    for (int i = 0; i < [viewNameArray count]; i++) {
       
        UIView *view = viewNameArray[i];
        view.frame =CGRectMake(0+[Globle shareInstance].globleWidth*i, 0, [Globle shareInstance].globleWidth, [Globle shareInstance].globleHeight-89-44);
      
        [self addSubview:view];
        
    }
}

-(void)tap
{
    NSLog(@"ddddd");
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    userContentOffsetX = scrollView.contentOffset.x;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (userContentOffsetX < scrollView.contentOffset.x) {
        isLeftScroll = YES;
    }
    else {
        isLeftScroll = NO;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //调整顶部滑条按钮状态
    [self adjustTopScrollViewButton:scrollView];
    
    if (isLeftScroll) {
        if (scrollView.contentOffset.x <= [Globle shareInstance].globleWidth*3) {
            [self.topView setContentOffset:CGPointMake(0, 0) animated:YES];
        }
        else {
            [self.topView setContentOffset:CGPointMake((POSITIONID-4)*64+45, 0) animated:YES];
        }
        
    }
    else {
        if (scrollView.contentOffset.x >= [Globle shareInstance].globleWidth*3) {
            [self.topView setContentOffset:CGPointMake(2*64+45, 0) animated:YES];
        }
        else {
            
            [self.topView setContentOffset:CGPointMake(0, 0) animated:YES];
        }
    }
}

- (void)adjustTopScrollViewButton:(UIScrollView *)scrollView
{
    [self.topView setButtonUnSelect];
    self.topView.scrollViewSelectedChannelID = POSITIONID+100;
    [self.topView setButtonSelect];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
