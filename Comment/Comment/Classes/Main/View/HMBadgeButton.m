//
//  HMBadgeButton.m
//  Comment
//
//  Created by 胡猛 on 2016/12/3.
//  Copyright © 2016年 HuMeng. All rights reserved.
//

#import "HMBadgeButton.h"

@implementation HMBadgeButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.hidden = YES;
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        self.userInteractionEnabled = NO;
        [self setBackgroundImage:[UIImage resizeImage:@"main_badge"] forState:UIControlStateNormal];
    }
    return self;
}


-(void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue = [badgeValue copy];
    
    if (self.badgeValue) {
        self.hidden = NO;
        [self setTitle:self.badgeValue forState:UIControlStateNormal];
        
        CGRect frame = self.frame;
        CGFloat badgeW = self.currentBackgroundImage.size.width;
        CGFloat badgeH = self.currentBackgroundImage.size.height;
        if (self.badgeValue.length > 1) {
            
            CGSize badgeSize = [self.badgeValue sizeWithFont:self.titleLabel.font];
            badgeW = badgeSize.width +10;
        }
        
        frame.size.width = badgeW;
        frame.size.height = badgeH;
        
        self.frame = frame;
        
    } else {
        self.hidden = YES;
    }
    
}

@end
