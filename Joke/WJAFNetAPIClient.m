//
//  WJAFNetAPIClient.m
//  JuanJoke
//
//  Created by wenjuan on 16/3/30.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "WJAFNetAPIClient.h"

@implementation WJAFNetAPIClient

+ (instancetype)sharedClient {
    static WJAFNetAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[WJAFNetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:URL_PREFIX]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        // 设置10秒超时 改为15秒
        _sharedClient.requestSerializer.timeoutInterval = 15;
        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        [_sharedClient.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {
                case AFNetworkReachabilityStatusReachableViaWWAN:
                    LOG(@"123123-------AFNetworkReachabilityStatusReachableViaWWAN------");
                    break;
                case AFNetworkReachabilityStatusReachableViaWiFi:
                    LOG(@"123123-------AFNetworkReachabilityStatusReachableViaWiFi------");
                    break;
                case AFNetworkReachabilityStatusNotReachable:
                    LOG(@"123123-------AFNetworkReachabilityStatusNotReachable------");
                    break;
                default:
                    break;
            }
        }];
        [_sharedClient.reachabilityManager startMonitoring];
    });
    return _sharedClient;
}

+ (instancetype)initClient:(NSString *)baseUrl {
    
    
    WJAFNetAPIClient *_sharedClient = [[WJAFNetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:baseUrl]];
    _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    // 设置10秒超时 改为15秒
    _sharedClient.requestSerializer.timeoutInterval = 15;
    _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
//    [_sharedClient.reachabilityManager startMonitoring];
    return _sharedClient;
}




/**
 *  post请求
 * @param  URLString        url
 * @param  parameters       请求参数
 * @param  block            回调函数
 */
- (NSURLSessionDataTask *)WJPOST:(NSString *)URLString parameters:(id)parameters compeletion:(void(^)(NSURLSessionDataTask *task,id responseObject, NSError *error))block {
     
////    //这个方法已经过期
//    return  [self POST:URLString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
//        LOG(@"URL = %@ ,=== post请求 = %@",URLString,responseObject);
//        block(task,responseObject,nil);
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        LOG(@"错误信息error =  %@",error);
//        block(task,nil,error);
//    }];

    
    return [self POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
         LOG(@"URL = %@ ,=== post请求 = %@",URLString,responseObject);
        block(task,responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        LOG(@"错误信息error =  %@",error);
        block(task,nil,error);
    }];
    
}


/**
 *  get请求
 * @param  URLString        url
 * @param  parameters       请求参数
 * @param  block            回调函数
 */
- (NSURLSessionDataTask *)WJGET:(NSString *)URLString parameters:(id)parameters compeletion:(void(^)(NSURLSessionDataTask *task,id responseObject, NSError *error))block {
    
    //这个方法已经过期
//    return [self GET:URLString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
//        LOG(@"URL = %@ ,=== get请求 = %@",URLString,responseObject);
//        
//        block(task,responseObject,nil);
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//        block(task,nil,error);
//    }];
    
    return  [self GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        LOG(@"URL = %@ ,=== get请求 = %@",URLString,responseObject);
        
        block(task,responseObject,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        LOG(@"错误信息error =  %@",error);
        block(task,nil,error);
    }];
}



@end
