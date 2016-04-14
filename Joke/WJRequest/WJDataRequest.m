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
+ (NSURLSessionDataTask *)getJokeContentList :(NSDictionary *)params compeletion:(void(^)(JokeContentResponse*response, NSError *error))block  {
    
    NSMutableDictionary *param = [@{@"sort":@"asc",
                                    @"page":@"2",
                                    @"pagesize":@"10",
                                    @"time":@"1418745237",
                                    @"key":@"a91393365afb1f6ca19b3fdd7d9409ec"}mutableCopy];
    //    params = param;
    
    
    return [[WJAFNetAPIClient sharedClient]WJGET:@"joke/content/list.from" parameters:param compeletion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *resultDict = responseObject;
            JokeContentResponse *messageDetail = [[JokeContentResponse alloc] initWithDictionary:resultDict];
            block(messageDetail, nil);
        }else {
            block(nil, error);
        }
    }];
    
}


/**
 *interest 趣图
 */
+ (NSURLSessionDataTask *)getInterestImage:(NSDictionary *)params compeletion:(void(^)(JokeContentResponse*response, NSError *error))block {
    NSMutableDictionary *param = [@{@"sort":@"asc",
                                    @"page":@"2",
                                    @"pagesize":@"10",
                                    @"time":@"1418745237",
                                    @"key":@"a91393365afb1f6ca19b3fdd7d9409ec"}mutableCopy];
    //    params = param;
    
    
    return [[WJAFNetAPIClient sharedClient]WJGET:@"joke/img/list.from" parameters:param compeletion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *resultDict = responseObject;
            JokeContentResponse *messageDetail = [[JokeContentResponse alloc] initWithDictionary:resultDict];
            block(messageDetail, nil);
        }else {
            block(nil, error);
        }
    }];
    
}



/**
 *微信精选
 */
+ (NSURLSessionDataTask *)getWeiXin:(NSDictionary *)params compeletion:(void(^)(WeiXinResponse*response, NSError *error))block {
    
    NSMutableDictionary *param = [@{@"pno":@"1",
                                    @"ps":@"20",
                                    @"dtype":@"json",
                                    @"key":@"d5ed5acf5657955629891a4e597d6227"}mutableCopy];
 
    
    
    return [[WJAFNetAPIClient initClient:@"http://v.juhe.cn/"]WJGET:@"weixin/query" parameters:param compeletion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *resultDict = responseObject;
            WeiXinResponse *messageDetail = [[WeiXinResponse alloc] initWithDictionary:resultDict];
            block(messageDetail, nil);
        }else {
            block(nil, error);
        }
    }];
}

@end
