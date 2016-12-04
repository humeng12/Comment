//
//  HMTabBarButton.m
//  Comment
//
//  Created by 胡猛 on 2016/12/3.
//  Copyright © 2016年 HuMeng. All rights reserved.
//

#import "HMTabBarButton.h"
#import "HMBadgeButton.h"

#define HMTabBarButtonRatio  0.6

#define HMTabBarButtonTttleColor (ios7 ? [UIColor blackColor] : [UIColor whiteColor])

#define HMTabBarButtonTttleSelectedColor (ios7 ? HMColor(61,185,175) : HMColor(248,139,0))

@interface HMTabBarButton()

@property (nonatomic, weak) HMBadgeButton *badgebutton;

@end

@implementation HMTabBarButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [self setTitleColor:HMTabBarButtonTttleSelectedColor forState:UIControlStateSelected];
        if (!ios7) {
            [self setBackgroundImage:[UIImage imageWithName:@"tabbar_slider"] forState:UIControlStateSelected];
        }
        
        
        HMBadgeButton *badgeButton = [[HMBadgeButton alloc] init];
        [self addSubview:badgeButton];
        self.badgebutton = badgeButton;
        self.badgebutton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
    }
    return self;
}


-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * HMTabBarButtonRatio;
    
    return CGRectMake(0, 0, imageW, imageH);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height * HMTabBarButtonRatio;
    
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}

-(void)setHighlighted:(BOOL)highlighted
{
    
}

-(void)setItem:(UITabBarItem *)item
{
    _item = item;
    
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selecedImage" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}


-(void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selecedImage"];
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setTitle:self.item.title forState:UIControlStateSelected];
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    
    
    self.badgebutton.badgeValue = self.item.badgeValue;
    
    CGFloat badgeY = 0;
    CGFloat badgeX = self.frame.size.width - self.badgebutton.frame.size.width;
    CGRect badgeF = self.badgebutton.frame;
    badgeF.origin.x = badgeX;
    badgeF.origin.y = badgeY;
    self.badgebutton.frame = badgeF;
}

@end
