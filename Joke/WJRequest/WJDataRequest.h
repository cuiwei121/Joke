//
//  WJDataRequest.h
//  JuanJoke
//
//  Created by wenjuan on 16/3/30.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WJAFNetAPIClient.h"
#import "WJBaseModel.h"
#import "JokeContentResponse.h"
#import "WeiXinResponse.h"

@interface WJDataRequest : NSObject
/**
 *笑话列表
 */
+ (NSURLSessionDataTask *)getJokeContentList :(NSDictionary *)params compeletion:(void(^)(JokeContentResponse*response, NSError *error))block ;

/**
 *interest 趣图
 */
+ (NSURLSessionDataTask *)getInterestImage:(NSDictionary *)params compeletion:(void(^)(JokeContentResponse*response, NSError *error))block ;

/**
 *微信精选
 */
+ (NSURLSessionDataTask *)getWeiXin:(NSDictionary *)params compeletion:(void(^)(WeiXinResponse*response, NSError *error))block ;
@end
