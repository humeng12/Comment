//
//  HMTabBar.m
//  Comment
//
//  Created by 胡猛 on 2016/12/3.
//  Copyright © 2016年 HuMeng. All rights reserved.
//

#import "HMTabBar.h"
#import "HMTabBarButton.h"

@interface HMTabBar()

@property (nonatomic, strong) NSMutableArray *tabBarButtons;
@property (nonatomic, weak) UIButton *selectBtn;

@end

@implementation HMTabBar

-(NSMutableArray *)tabBarButtons
{
    if (_tabBarButtons == nil) {
        _tabBarButtons = [NSMutableArray array];
    }
    
    return _tabBarButtons;
}


-(void)addTabButtonWithItem:(UITabBarItem *)item
{
    HMTabBarButton *btn = [[HMTabBarButton alloc] init];
    [self addSubview:btn];
    
    [self.tabBarButtons addObject:btn];
    
    btn.item = item;
    
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    if (self.tabBarButtons.count == 1) {
        [self buttonClick:btn];
    }
}


-(void)buttonClick:(HMTabBarButton *)btn
{
    if ([self.delagate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        
        [self.delagate tabBar:self didSelectedButtonFrom:self.selectBtn.tag to:btn.tag];
    }
    self.selectBtn.selected = NO;
    btn.selected = YES;
    self.selectBtn = btn;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat h = self.frame.size.height;
    CGFloat w = self.frame.size.width;
    
    NSInteger countOfView = self.subviews.count;
    
    CGFloat buttonW = w / countOfView;
    CGFloat buttonY = 0;
    CGFloat buttonH = h;
    
    for (int index = 0; index < self.tabBarButtons.count; index++) {
        
        HMTabBarButton *btn = self.tabBarButtons[index];
        btn.tag = index;
        CGFloat buttonX = index * buttonW;
        btn.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }
}


@end
