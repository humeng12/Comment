//
//  NewsTableViewCell.m
//  Comment
//
//  Created by 胡猛 on 2016/12/4.
//  Copyright © 2016年 HuMeng. All rights reserved.
//

#import "NewsTableViewCell.h"

@interface NewsTableViewCell()

@property (nonatomic, weak) UIImageView *iconImageView;

@property (nonatomic, weak) UIView *lineView;
@end

@implementation NewsTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setupUI];
    }
    
    return self;
}


-(void)setupUI
{
    UIImageView *iconView = [UIImageView new];
    iconView.contentMode = UIViewContentModeScaleToFill;
    [iconView sd_setImageWithURL:[NSURL URLWithString:@"http://p1.meituan.net/feop/c123b5f1f4dfddebc1cdf272b40e423b4334.png"]];
    [self.contentView addSubview:iconView];
    self.iconImageView = iconView;
    
    
    UIView *line = [UIView new];
    line.backgroundColor = [UIColor colorWithRed:0xE2/255.0f green:0xE2/255.0f blue:0xE2/255.0f alpha:0.5];
    [self.contentView addSubview:line];
    self.lineView = line;
}


- (void)awakeFromNib {
    [super awakeFromNib];

}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.contentView.mas_left).offset(10);
        make.top.mas_equalTo(self.contentView.mas_top).offset(10);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
    }];
    
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.iconImageView.mas_right).offset(10);
        make.top.mas_equalTo(self.contentView.mas_top).offset(5);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-5);
        make.width.mas_equalTo(0.5);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
