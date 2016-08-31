//
//  ShareHelper.h
//  LongDai
//
//  Created by xuzhou on 15/11/24.
//  Copyright © 2015年 Gozap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDK.h>


@interface ShareHelper : NSObject
+(void)sharePlatformType:(ShareType)type content:(NSString *)content image:(NSString *)image title:(NSString *)title url:(NSString *)url;

+(void)shareformType:(ShareType)type content:(NSString *)content image:(UIImage *)image title:(NSString *)title url:(NSString *)url compeletion:(void(^)(BOOL success))block;
@end
