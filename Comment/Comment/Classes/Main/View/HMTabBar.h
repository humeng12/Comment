//
//  HMTabBar.h
//  Comment
//
//  Created by 胡猛 on 2016/12/3.
//  Copyright © 2016年 HuMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMTabBar;

@protocol HMTabBarDelegate <NSObject>

@optional
-(void)tabBar:(HMTabBar *)tabBar didSelectedButtonFrom:(NSInteger)form to:(NSInteger)to;

@end

@interface HMTabBar : UIView

-(void)addTabButtonWithItem:(UITabBarItem *)item;

@property (nonatomic, weak) id<HMTabBarDelegate>delagate;

@end
