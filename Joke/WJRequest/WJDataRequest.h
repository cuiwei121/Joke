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

@interface WJDataRequest : NSObject
/**
 *笑话列表
 */
+ (NSURLSessionDataTask *)getJokeContentList :(NSDictionary *)params compeletion:(void(^)(WJBaseModel*response, NSError *error))block ;
@end
