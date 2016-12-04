//
//  NewsModel.m
//  Comment
//
//  Created by 胡猛 on 2016/12/4.
//  Copyright © 2016年 HuMeng. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        NSLog(@"%@",dict);
        
        self.citynewsLogo = [NSString stringWithFormat:@"%@",dict[@"citynewsLogo"]];
        self.detailLinkPart = [NSString stringWithFormat:@"%@",dict[@"detailLinkPart"]];
        self.entryid = [NSString stringWithFormat:@"%@",dict[@"entryid"]];
        self.ID = [NSString stringWithFormat:@"%@",dict[@"id"]];
        self.isWelcomOpen = [NSString stringWithFormat:@"%@",dict[@"isWelcomOpen"]];
        self.locateModeName = [NSString stringWithFormat:@"%@",dict[@"locateModeName"]];
        self.name = [NSString stringWithFormat:@"%@",dict[@"name"]];
        self.citynewsRegion = dict[@"resource"][@"citynewsRegion"];
    }
    return self;
}
+(instancetype)newsModelWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
