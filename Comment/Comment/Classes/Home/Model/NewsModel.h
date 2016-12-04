//
//  NewsModel.h
//  Comment
//
//  Created by 胡猛 on 2016/12/4.
//  Copyright © 2016年 HuMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject


@property (nonatomic, strong) NSString *citynewsLogo;
@property (nonatomic, strong) NSString *detailLinkPart;
@property (nonatomic, strong) NSString *entryid;
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *isWelcomOpen;
@property (nonatomic, strong) NSString *locateModeName;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *citynewsRegion;


-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)newsModelWithDict:(NSDictionary *)dict;

@end
