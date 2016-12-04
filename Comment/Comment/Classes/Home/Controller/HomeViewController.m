//
//  HomeViewController.m
//  Comment
//
//  Created by 胡猛 on 2016/12/3.
//  Copyright © 2016年 HuMeng. All rights reserved.
//

#import "HomeViewController.h"
#import "HeaderTableViewCell.h"
#import "NewsModel.h"
#import "NewsTableViewCell.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation HomeViewController


-(UITableView *)tableView
{
    if (_tableView == nil) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) style:UITableViewStyleGrouped];
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
    
    [self loadData];

}


-(void)setupUI
{
    [self.view addSubview:self.tableView];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
}


-(void)loadData
{
    [[HDNetworking sharedHDNetworking] GET:@"http://aop.meituan.com/api/entry/topWelcome?uuid=C805B327412AF9F6262501FCEC347B16DF07006BC5B0B6FC8BA253D150E9127E&utm_source=AppStore&utm_term=7.5.0&latlng=40.079686%2C116.375468&rn_package_version=0&utm_content=C805B327412AF9F6262501FCEC347B16DF07006BC5B0B6FC8BA253D150E9127E&utm_medium=iphone&version_name=7.5.0&movieBundleVersion=100&utm_campaign=AgroupBgroupH0&__reqTraceID=B59E27FC-7000-4234-92D5-1DD49C565FEF&js_patch_version=12&ci=1&msid=CC200AF4-2171-41FF-BBF9-EED564B8F44D2016-12-03-19-57280" parameters:@{} success:^(id  _Nonnull responseObject) {

        [NewsModel newsModelWithDict:responseObject[@"data"]];
        
    } failure:^(NSError * _Nonnull error) {
        
        
    }];
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    [cell setLayoutMargins:UIEdgeInsetsZero];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0){
        return 2;
    }
    return 3;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            return 200;
        } else {
            return 50;
        }
    }
    return 50;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.01;
    }
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *backView = [[UIView alloc] init];
    if (section == 0) {
        backView.frame = CGRectMake(0, 0, kScreenW, 0);
    } else {
    
        backView.frame = CGRectMake(0, 0, kScreenW, 10);
    }
    
    return backView;
}


////有时候需要去掉多余的分割线 就可以通过一下这个方法实现  这个方法要在
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (tableView.dataSource>0) {
//        tableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
//        [self setExtraCellLineHidden:tableView];
//    }else{
//        tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
//}
//    
//    
////经过这个判断之后调用下面的方法就可以实现 有数据时就有分割线没有数据时就没有分割线
//- (void)setExtraCellLineHidden: (UITableView *)tableView
//{
//    UIView *view =[ [UIView alloc]init];
//    view.backgroundColor = [UIColor clearColor];
//    [tableView setTableFooterView:view];
//}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            return [self headerTableviewCell:tableView indexPath:indexPath];
        } else {
            return [self newsTableviewCell:tableView indexPath:indexPath];
        }
    } else {
        
        UITableViewCell *cell = nil;
        static NSString *cellID = @"cellID";
        cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
     
         return cell;
    }
}


-(HeaderTableViewCell *)headerTableviewCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
    HeaderTableViewCell *cell;
    
    cell = [HeaderTableViewCell cellWithTableView:tableView];
    cell.titleArray = @[@[@"美食",@"电影",@"酒店住宿",@"休闲娱乐",@"外卖",@"机票/火车票",@"KTV",@"周边游",@"丽人",@"旅游出行"],@[@"高端酒店",@"足疗按摩",@"美发",@"母子亲子",@"结婚",@"景点",@"水上乐园",@"学习培训",@"家装",@"全部分类"]];
    
    cell.imageArray = @[@[@"icon_homepage_foodCategory",@"icon_homepage_movieCategory",@"icon_homepage_hotelCategory",@"icon_homepage_entertainmentCategory",@"icon_homepage_takeoutCategory",@"icon_homepage_trainCategory",@"icon_homepage_KTVCategory",@"icon_homepage_aroundjourneyCategory",@"icon_homepage_beautyCategory",@"icon_homepage_travellingCategory"],@[@"icon_homepage_highStarHotelCategory",@"icon_homepage_foottreatCategory",@"icon_homepage_haircutCategory",@"icon_homepage_momInfantCategory",@"icon_homepage_marriageCategory",@"icon_homepage_sceneryCategory",@"icon_homepage_aroundjourneyCategory",@"icon_homepage_educationCategory",@"icon_homepage_homeDecorationCategory",@"icon_homepage_moreCategory"]];
    
    return cell;
}



-(NewsTableViewCell *)newsTableviewCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
    NewsTableViewCell *cell = nil;
    static NSString *cellID = @"cellID";
    cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[NewsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
