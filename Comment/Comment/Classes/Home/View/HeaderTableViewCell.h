//
//  HeaderTableViewCell.h
//  Comment
//
//  Created by 胡猛 on 2016/12/3.
//  Copyright © 2016年 HuMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderTableViewCell : UITableViewCell

+(HeaderTableViewCell *)headerTableViewCell;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@property(nonatomic, strong) NSArray *titleArray;
@property(nonatomic, strong) NSArray *imageArray;
@end
