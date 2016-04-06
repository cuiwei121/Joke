//
//  WJDataRequest.m
//  JuanJoke
//
//  Created by wenjuan on 16/3/30.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "WJDataRequest.h"


@implementation WJDataRequest
 
/*
 // 获取退款信息
 + (NSURLSessionDataTask *)fetchApplyRefund:(NSDictionary *)params compeletion:(void(^)(ApplyRefundResponse *response, NSError *error))block ;
 */
/**
 *笑话列表
 */
+ (NSURLSessionDataTask *)getJokeContentList :(NSDictionary *)params compeletion:(void(^)(WJBaseModel*response, NSError *error))block  {
    
//    //调用封装的post请求
//    return [[WJAFNetAPIClient sharedClient] POST:@"verifyCode" parameters:params compeletion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
//        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
//            NSMutableDictionary *resultDict = responseObject;
//            VerifyCodeResponse *response = [[VerifyCodeResponse alloc] initWithDictionary:resultDict];
//            block(response, nil);
//        }else {
//            block(nil, error);
//        }
//    }];
    
    NSMutableDictionary *param = [@{@"sort":@"asc",
                                    @"page":@"2",
                                    @"pagesize":@"10",
                                    @"time":@"1418745237",
                                    @"key":@"a91393365afb1f6ca19b3fdd7d9409ec"}mutableCopy];
//    params = param;
    

    return [[WJAFNetAPIClient sharedClient]WJGET:@"joke/content/list.from" parameters:param compeletion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
        
    }];
    
}

@end
