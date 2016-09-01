//
//  ShareHelper.m
//  LongDai
//
//  Created by xuzhou on 15/11/24.
//  Copyright © 2015年 Gozap. All rights reserved.
//

#import "ShareHelper.h"

@implementation ShareHelper
-(instancetype)init{
    self= [super init];
    if (self) {
        
    }
    return self;
}
+(void)sharePlatformType:(ShareType)type content:(NSString *)content image:(NSString *)image title:(NSString *)title url:(NSString *)url {
    if (type == ShareTypeSMS) {
        image = nil;
    }
    id<ISSContent> publishContent;
    if (type == ShareTypeWeixiTimeline ) {
        publishContent = [ShareSDK content:content
                            defaultContent:content
                                     image:[ShareSDK imageWithUrl:image]
                                     title:title
                                       url:url
                               description:content
                                 mediaType:SSPublishContentMediaTypeNews];
    }else if (type == ShareTypeWeixiSession || type == ShareTypeSinaWeibo||type ==ShareTypeWeixiFav|| type==ShareTypeQQSpace){
        publishContent = [ShareSDK content:[NSString stringWithFormat:@"%@%@",title,url]
                            defaultContent:content
                                     image:[ShareSDK imageWithUrl:image]
                                     title:@"龙贷"
                                       url:url
                               description:content
                                 mediaType:SSPublishContentMediaTypeNews];
    }else{
        publishContent = [ShareSDK content:content
                            defaultContent:@"龙贷"
                                     image:[ShareSDK imageWithUrl:image]
                                     title:@"龙贷分享"
                                       url:url
                               description:content
                                 mediaType:SSPublishContentMediaTypeNews];
    }
    [ShareSDK clientShareContent:publishContent //内容对象
                            type:type //平台类型
                   statusBarTips:YES
                          result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {//返回事件
                              
                              if (state == SSPublishContentStateSuccess)
                              {
                                  LOG(NSLocalizedString(@"TEXT_SHARE_SUC", @"分享成功!"));
                              }
                              else if (state == SSPublishContentStateFail)
                              {
                                  LOG(NSLocalizedString(@"TEXT_ShARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
                              }
                          }];

}


+(void)shareformType:(ShareType)type content:(NSString *)content image:(UIImage *)image title:(NSString *)title url:(NSString *)url{
    
    //SSPublishContentMediaTypeImage
    if (type == ShareTypeSMS) {
        image = nil;
    }
    id<ISSContent> publishContent;
    if (type == ShareTypeWeixiTimeline ) {
        publishContent = [ShareSDK content:content
                            defaultContent:content
                                     image:[ShareSDK pngImageWithImage:image]
                                     title:title
                                       url:url
                               description:content
                                 mediaType:SSPublishContentMediaTypeImage];
    }else if (type == ShareTypeWeixiSession || type == ShareTypeSinaWeibo||type ==ShareTypeWeixiFav|| type==ShareTypeQQSpace){
        publishContent = [ShareSDK content:[NSString stringWithFormat:@"%@%@",title,url]
                            defaultContent:content
                                     image:[ShareSDK pngImageWithImage:image]
                                     title:@"龙贷"
                                       url:url
                               description:content
                                 mediaType:SSPublishContentMediaTypeImage];
    }else{
        publishContent = [ShareSDK content:content
                            defaultContent:@"龙贷"
                                     image:[ShareSDK pngImageWithImage:image]
                                     title:@"搞笑是一本正经的！"
                                       url:url
                               description:content
                                 mediaType:SSPublishContentMediaTypeImage];
    }
    [ShareSDK clientShareContent:publishContent //内容对象
                            type:type //平台类型
                   statusBarTips:YES
                          result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {//返回事件
                              
                              if (state == SSPublishContentStateSuccess)
                              {
                                  LOG(NSLocalizedString(@"TEXT_SHARE_SUC", @"分享成功!"));
                               
                              }
                              else if (state == SSPublishContentStateFail)
                              {
                                  LOG(NSLocalizedString(@"TEXT_ShARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
                            
                              }
                          }];
    
}


+(void)shareType:(ShareType)type content:(NSString *)content image:(UIImage *)image title:(NSString *)title url:(NSString *)url publishContentMediaType:(SSPublishContentMediaType)publishContentMediaType {

    if (type == ShareTypeSMS) {
        image = nil;
    }
    id<ISSContent> publishContent;
    if (type == ShareTypeWeixiTimeline ) {
        publishContent = [ShareSDK content:content
                            defaultContent:content
                                     image:[ShareSDK pngImageWithImage:image]
                                     title:title
                                       url:url
                               description:content
                                 mediaType:publishContentMediaType];
    }else if (type == ShareTypeWeixiSession || type == ShareTypeSinaWeibo||type ==ShareTypeWeixiFav|| type==ShareTypeQQSpace){
        publishContent = [ShareSDK content:[NSString stringWithFormat:@"%@%@",title,url]
                            defaultContent:content
                                     image:[ShareSDK pngImageWithImage:image]
                                     title:@"一本正精"
                                       url:url
                               description:content
                                 mediaType:publishContentMediaType];
    }else{
        publishContent = [ShareSDK content:content
                            defaultContent:@"一本正精"
                                     image:[ShareSDK pngImageWithImage:image]
                                     title:@"搞笑是一本正经的！"
                                       url:url
                               description:content
                                 mediaType:publishContentMediaType];
    }
    [ShareSDK clientShareContent:publishContent //内容对象
                            type:type //平台类型
                   statusBarTips:YES
                          result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {//返回事件
                              
                              if (state == SSPublishContentStateSuccess)
                              {
                                  LOG(NSLocalizedString(@"TEXT_SHARE_SUC", @"分享成功!"));
                                  
                              }
                              else if (state == SSPublishContentStateFail)
                              {
                                  LOG(NSLocalizedString(@"TEXT_ShARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
                                  
                              }
                          }];
    
}



@end
