//
//  HeaderCollectionCell.m
//  Comment
//
//  Created by 胡猛 on 2016/12/3.
//  Copyright © 2016年 HuMeng. All rights reserved.
//

#import "HeaderCollectionCell.h"


@interface HeaderCollectionCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation HeaderCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.text = self.titleStr;
    self.iconImageView.image = [UIImage imageNamed:self.imageStr];
}


@end
