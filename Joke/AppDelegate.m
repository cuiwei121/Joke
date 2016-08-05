//
//  AppDelegate.m
//  Joke
//
//  Created by wenjuan on 16/4/5.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <ShareSDK/ShareSDK.h>
//腾讯开放平台（对应QQ和QQ空间）SDK头文件
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>
//微信SDK头文件
#import "WXApi.h"
//新浪微博SDK头文件
#import "WeiboSDK.h"




/*
 [ShareSDK registerApp:@"4aed488890b1"];
 //当使用新浪微博客户端分享的时候需要按照下面的方法来初始化新浪的平台
 [ShareSDK connectSinaWeiboWithAppKey:@"1684535162"
 appSecret:@"769764d2df924f79c56a1a6d6c5451ed"
 redirectUri:@"http://www.longdai.com/download.do"
 weiboSDKCls:[WeiboSDK class]];
 
 //添加QQ空间应用  注册网址  http://connect.qq.com/intro/login/
 [ShareSDK connectQZoneWithAppKey:@"1101841828"
 appSecret:@"aed9b0303e3ed1e27bae87c33761161d"
 qqApiInterfaceCls:[QQApiInterface class]
 tencentOAuthCls:[TencentOAuth class]];
 
 //添加QQ应用  注册网址  http://open.qq.com/
 [ShareSDK connectQQWithQZoneAppKey:@"1101841828"
 qqApiInterfaceCls:[QQApiInterface class]
 tencentOAuthCls:[TencentOAuth class]];
 
 //添加微信应用 注册网址 http://open.weixin.qq.com
 [ShareSDK connectWeChatWithAppId:@"wx5c4fbd2bb59386a0"
 appSecret:@"91943dfafc622a027ad8f98ebc5616fe"
 wechatCls:[WXApi class]];
 
 //添加短信
 [ShareSDK connectSMS];
 
 //添加邮件
 [ShareSDK connectMail];
 */





@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UINavigationController *na = [[UINavigationController alloc]initWithRootViewController:[[ViewController alloc]init]];
    self.window.rootViewController = na;
    [self shareSetup];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

 
#pragma mark - 111

/*
 ShareSDK.registerApp("10ceb4d796c88")
 //当使用新浪微博客户端分享的时候需要按照下面的方法来初始化新浪的平台
 ShareSDK.connectSinaWeiboWithAppKey("3112753426", appSecret: "8d827d8c5849b1d763f2d077d20e109e", redirectUri: "http://www.xzzai.com")
 
 //添加QQ  注册网址  http://open.qq.com/
 ShareSDK.connectQQWithQZoneAppKey("1105277654",qqApiInterfaceCls:QQApiInterface.self,tencentOAuthCls:TencentOAuth.self)
 ShareSDK.connectQZoneWithAppKey("1105277654", appSecret: "bQcT8M8lTt9MATbY")
 
 //添加微信应用 注册网址 http://open.weixin.qq.com
 ShareSDK.connectWeChatWithAppId("wx88234dc1246eb81b",appSecret:"1c4d416db0008c17e01d616cb3866db7",wechatCls:WXApi.self)
 */
-(void)shareSetup{
    [ShareSDK registerApp:@"10ceb4d796c88"];
    //当使用新浪微博客户端分享的时候需要按照下面的方法来初始化新浪的平台
    [ShareSDK  connectSinaWeiboWithAppKey:@"3112753426"
                                appSecret:@"8d827d8c5849b1d763f2d077d20e109e"
                              redirectUri:@"http://www.xzzai.com"
                              weiboSDKCls:[WeiboSDK class]];
    
    
    //添加QQ空间应用  注册网址  http://connect.qq.com/intro/login/
    [ShareSDK connectQZoneWithAppKey:@"1105277654"
                           appSecret:@"bQcT8M8lTt9MATbY"
                   qqApiInterfaceCls:[QQApiInterface class]
                     tencentOAuthCls:[TencentOAuth class]];
    
    //添加QQ应用  注册网址  http://open.qq.com/
    [ShareSDK connectQQWithQZoneAppKey:@"1105277654"
                     qqApiInterfaceCls:[QQApiInterface class]
                       tencentOAuthCls:[TencentOAuth class]];
    
    //添加微信应用 注册网址 http://open.weixin.qq.com
    //    [ShareSDK connectWeChatWithAppId:@"wx96ad3427da325ef7"
    //                           wechatCls:[WXApi class]];
    [ShareSDK connectWeChatWithAppId:@"wx88234dc1246eb81b"
                           appSecret:@"1c4d416db0008c17e01d616cb3866db7"
                           wechatCls:[WXApi class]];

}

@end
