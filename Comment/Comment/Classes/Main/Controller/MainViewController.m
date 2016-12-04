//
//  MainViewController.m
//  Comment
//
//  Created by 胡猛 on 2016/12/3.
//  Copyright © 2016年 HuMeng. All rights reserved.
//

#import "MainViewController.h"
#import "HMTabBar.h"
#import "HomeViewController.h"
#import "DiscountViewController.h"
#import "FindViewController.h"
#import "MeViewController.h"


@interface MainViewController ()<HMTabBarDelegate>
@property (nonatomic, weak) HMTabBar *customTabbar;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTabbar];
    
    [self setupAllControllers];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

-(void)setupTabbar
{
    HMTabBar *customTabbar = [[HMTabBar alloc] init];
    customTabbar.delagate = self;
    customTabbar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:customTabbar];
    self.customTabbar = customTabbar;
}


-(void)setupAllControllers
{
    HomeViewController *home = [[HomeViewController alloc] init];
    //home.tabBarItem.badgeValue = @"99+";
    [self setupChildViewController:home title:@"首页" imageName:@"icon_tabbar_homepage" selectedImageName:@"icon_tabbar_homepage_selected"];
    
    DiscountViewController *message = [[DiscountViewController alloc] init];
    [self setupChildViewController:message title:@"附近" imageName:@"icon_tabbar_nearby_normal" selectedImageName:@"icon_tabbar_nearby_normal"];
    
    FindViewController *discover = [[FindViewController alloc] init];
    [self setupChildViewController:discover title:@"订单" imageName:@"icon_tabbar_order" selectedImageName:@"icon_tabbar_order_selected"];
    
    MeViewController *my = [[MeViewController alloc] init];
    [self setupChildViewController:my title:@"我的" imageName:@"icon_tabbar_mine" selectedImageName:@"icon_tabbar_mine_selected"];
}


-(void)setupChildViewController:(UIViewController *)childVC title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    childVC.title = title;
    //    childVC.tabBarItem.title = title;
    childVC.tabBarItem.image = [UIImage imageWithName:imageName];
    if (ios7) {
        childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    } else {
        childVC.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    }
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];
    
    
    [self.customTabbar addTabButtonWithItem:childVC.tabBarItem];
}

-(void)tabBar:(HMTabBar *)tabBar didSelectedButtonFrom:(NSInteger)form to:(NSInteger)to
{
    self.selectedIndex = to;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
