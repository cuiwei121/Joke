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
+ (NSURLSessionDataTask *)getJokeContentList :(NSString *)params compeletion:(void(^)(JokeContentResponse*response, NSError *error))block  {
    
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    long long int date = (long long int)time;
    date = date - 2*24*60*60*1000;
    
    NSMutableDictionary *param = [@{@"sort":@"asc",
                                    @"page":params,
                                    @"pagesize":@"10",
                                    @"time":@(date),
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
    
    
//    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
//    long long int date = (long long int)time;
    NSMutableDictionary *param = [@{@"dtype":@"json",
                                    @"key":@"6a4b38f8732902188c17482e8c5b79a3"}mutableCopy];
    //    params = param;
    //http://v.juhe.cn/wz/citys
    return [[WJAFNetAPIClient initClient:@"http://v.juhe.cn/"]WJGET:@"wz/citys" parameters:param compeletion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            //LOG(@"聚合数据   ： param =  %@ \n response = %@",param,responseObject);
//            NSMutableDictionary *resultDict = responseObject;
//            WeiXinResponse *messageDetail = [[WeiXinResponse alloc] initWithDictionary:resultDict];
//            block(messageDetail, nil);
        }else {
            block(nil, error);
        }
    }];
//    
//    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
//    long long int date = (long long int)time;
//    NSMutableDictionary *param = [@{@"sort":@"asc",
//                                    @"page":@"1",
//                                    @"pagesize":@"10",
//                                    @"time":@(date),
//                                    @"key":@"a91393365afb1f6ca19b3fdd7d9409ec"}mutableCopy];
//    //    params = param;
//    
//    
//    return [[WJAFNetAPIClient sharedClient]WJGET:@"joke/img/list.from" parameters:param compeletion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
//        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
//            NSMutableDictionary *resultDict = responseObject;
//            JokeContentResponse *messageDetail = [[JokeContentResponse alloc] initWithDictionary:resultDict];
//            block(messageDetail, nil);
//        }else {
//            block(nil, error);
//        }
//    }];
    
}



/**
 *微信精选
 */
+ (NSURLSessionDataTask *)getWeiXin:(NSString *)params compeletion:(void(^)(WeiXinResponse*response, NSError *error))block {
    
    NSMutableDictionary *param = [@{@"pno":params,
                                    @"ps":@"2",
                                    @"dtype":@"json",
                                    @"key":@"d5ed5acf5657955629891a4e597d6227"}mutableCopy];
 
    
    
    return [[WJAFNetAPIClient initClient:@"http://v.juhe.cn/"]WJGET:@"weixin/query" parameters:param compeletion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            //LOG(@"微信  经文 ： param =  %@ \n response = %@",param,responseObject);
            NSMutableDictionary *resultDict = responseObject;
            WeiXinResponse *messageDetail = [[WeiXinResponse alloc] initWithDictionary:resultDict];
             LOG(@"微信  经文 ： reason =  %@  @",messageDetail.reason);
            block(messageDetail, nil);
        }else {
            block(nil, error);
        }
    }];
}

@end
