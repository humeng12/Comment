//
//  HDPicModle.m
//  PortableTreasure
//
//  Created by 胡猛 on 2016/12/3.
//  Copyright © 2016年 HuMeng. All rights reserved.
//

#import "HDPicModle.h"

@implementation HDPicModle

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@ : %p> \n{picName : %@ \n pic : %@ \n}", [self class], self,self.picName, self.pic];
}

@end
