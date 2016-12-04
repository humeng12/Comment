//
//  HomeViewModel.h
//  Comment
//
//  Created by 胡猛 on 2016/12/4.
//  Copyright © 2016年 HuMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ _Nullable LoadSucess)(id responseObject);

typedef void (^ _Nullable LoadFailure)(NSError *error);

@interface HomeViewModel : NSObject
+(void)loadData:(NSString *)URLString LoadSucess:(LoadSucess)loadSucess LoadFailure:(LoadFailure)loadFailure;
@end

NS_ASSUME_NONNULL_END
