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
 如果研发团队去中心化，团队主管这个职位是不是可以撤了？ - 出家如初,成佛有余 - 关注电子商务领域，关注无线互联网，关注新媒体;
 http://www.yeeach.com/post/1293
 
 支付系统风控系统建设思考 - 出家如初,成佛有余 - 关注电子商务领域，关注无线互联网，关注新媒体;
 http://www.yeeach.com/post/235
 
 交易系统和风控系统的架构怎么设计？ - 出家如初,成佛有余 - 关注电子商务领域，关注无线互联网，关注新媒体;
 http://www.yeeach.com/post/1286
 
 第三方支付商户设计理念区分B帐户和C账户出于什么考虑？ - 出家如初,成佛有余 - 关注电子商务领域，关注无线互联网，关注新媒体;
 http://www.yeeach.com/post/1299
 
 一个没有专业背景的小白怎么入行 互联网金融？ - 出家如初,成佛有余 - 关注电子商务领域，关注无线互联网，关注新媒体;
 http://www.yeeach.com/post/1298
 
 第三方网络支付平台如何确保大众资金安全？ - 出家如初,成佛有余 - 关注电子商务领域，关注无线互联网，关注新媒体;
 http://www.yeeach.com/post/1297
 
 支付系统对账算法优化方案 - 出家如初,成佛有余 - 关注电子商务领域，关注无线互联网，关注新媒体;
 http://www.yeeach.com/post/1318
 
 POS签购单上的授权号，凭证号，参考号，批次号，分别是什么？有什么作用 - 出家如初,成佛有余 - 关注电子商务领域，关注无线互联网，关注新媒体;
 http://www.yeeach.com/post/1317
 
 美团、饿了么这些平台先收消费者的钱，然后再转账给商户，在财务上是怎么处理的？ - 出家如初,成佛有余 - 关注电子商务领域，关注无线互联网，关注新媒体;
 http://www.yeeach.com/post/1312
 
 如何从零起步学习支付行业相关知识？ - 出家如初,成佛有余 - 关注电子商务领域，关注无线互联网，关注新媒体;
 http://www.yeeach.com/post/1311
 
 高并发交易驱动系统方案 - 出家如初,成佛有余 - 关注电子商务领域，关注无线互联网，关注新媒体;
 http://www.yeeach.com/post/1290
 
 支付平台的账户体系结构是怎么设计的？ - 出家如初,成佛有余 - 关注电子商务领域，关注无线互联网，关注新媒体;
 http://www.yeeach.com/post/128
 */

/*
 通过反编译深入理解Java String及intern - ImportNew
 http://www.importnew.com/21024.html
 
 java 8实现的一个最简单的mysql代理服务器 - 孟飞阳 的个人空间 - 开源中国社区
 http://my.oschina.net/u/2391658/blog/729095
 
 终止阻塞的线程 - ImportNew
 http://www.importnew.com/21015.html
 
 双机高可用、负载均衡、MySQL(读写分离、主从自动切换)架构设计 - 文章 - 伯乐在线
 http://blog.jobbole.com/104367/
 
 新出炉的 100+ 篇技术热文，在微信热传，别错过哦 - 文章 - 伯乐在线
 http://blog.jobbole.com/104362/
 
 Linux 系统结构详解
 http://mp.weixin.qq.com/s
 ?__biz=MzAxODI5ODMwOA==&mid=2666539346&idx=1&sn=0783fcbd7a8aee2d54b81c791d1e3c0d&scene=21#wechat_redirect
 
 Nginx 工作原理和优化、漏洞（上）
 http://mp.weixin.qq.com/s?__biz=MzAxODI5ODMwOA==&mid=2666539355&idx=1&sn=820961a75ceec72c3700410dcc75f882&scene=21#wechat_redirect
 
 
 Nginx 工作原理和优化、漏洞（下）
 http://mp.weixin.qq.com/s?__biz=MzAxODI5ODMwOA==&mid=2666539355&idx=2&sn=ab29f60586fdd0d712cecbf7dcfa7da4&scene=21#wechat_redirect
 
 
 八大排序算法
 http://mp.weixin.qq.com/s?__biz=MzI1MTIzMzI2MA==&mid=2650560135&idx=1&sn=81d2c61e66738f3869ec4e96ffb15e38&scene=21#wechat_redirect
 
 
 如何简单解释 MapReduce 算法
 http://mp.weixin.qq.com/s?__biz=MzI1MTIzMzI2MA==&mid=2650560085&idx=1&sn=5edeb6e16caf8042a6416ed99857da5c&scene=21#wechat_redirect
 
 
 算法：塔防游戏中的路径寻找
 http://mp.weixin.qq.com/s?__biz=MzI1MTIzMzI2MA==&mid=2650560044&idx=1&sn=25d06523cd180251a63359bdabbd4ba7&scene=21#wechat_redirect
 
 
 一致性哈希算法原理设计
 http://mp.weixin.qq.com/s?__biz=MzI1MTIzMzI2MA==&mid=2650560058&idx=1&sn=fb6b99fe9ceec392ee988a4b1f3b00aa&scene=21#wechat_redirect
 
 
 大型网站架构体系的演变
 http://mp.weixin.qq.com/s?__biz=MzA5ODM5MDU3MA==&mid=2650861697&idx=1&sn=a75f44ac89036360cd2f4121e32c3e99&scene=21#wechat_redirect
 
 
 也谈谈 Redis 和 Memcached 的区别
 http://mp.weixin.qq.com/s?__biz=MzA5ODM5MDU3MA==&mid=2650861849&idx=1&sn=2b7b605b3f27209e060f11b9c9bbf2bd&scene=21#wechat_redirect
 
 
 聊聊阻塞与非阻塞、同步与异步、I/O 模型
 http://mp.weixin.qq.com/s?__biz=MzA5ODM5MDU3MA==&mid=2650861845&idx=1&sn=7ce6bc4b75bbe6d68c1ca313a4221c09&scene=21#wechat_redirect
 
 
 Redis 和 Memcached 的区别
 http://mp.weixin.qq.com/s?__biz=MzA5ODM5MDU3MA==&mid=2650861782&idx=1&sn=3d4a96a45ae6b4c43e8ca6440404672f&scene=21#wechat_redirect
 
 
 数据库之锁的实践
 http://mp.weixin.qq.com/s?__biz=MzA5ODM5MDU3MA==&mid=2650861823&idx=1&sn=f31d6eedaf52f0f58799bf8439e3eda4&scene=21#wechat_redirect
 
 
 优化 MySQL 中的分页
 http://mp.weixin.qq.com/s?__biz=MzA5ODM5MDU3MA==&mid=2650861784&idx=1&sn=cb80e88bcac7951897fff6800e238eac&scene=21#wechat_redirect
 
 
 LVS：三种负载均衡方式比较 + 另三种负载均衡方式
 http://mp.weixin.qq.com/s?__biz=MzA5ODM5MDU3MA==&mid=2650861862&idx=1&sn=976ddfe2517dc42796bc9977d379447c&scene=21#wechat_redirect
 
 
 通信协议——HTTP、TCP、UDP
 http://mp.weixin.qq.com/s?__biz=MjM5NzMyMjAwMA==&mid=2651477296&idx=1&sn=dd3fbe5f9393bcd505919314148610fc&scene=21#wechat_redirect
 
 
 深入浅出 SOA 思想
 http://mp.weixin.qq.com/s?__biz=MjM5NzMyMjAwMA==&mid=2651477283&idx=1&sn=86f69897ee68d65ab38d59edc1c7ef86&scene=21#wechat_redirect
 
 
 高并发性能调试经验分享
 http://mp.weixin.qq.com/s?__biz=MjM5NzMyMjAwMA==&mid=2651477305&idx=1&sn=185bc510e4011b3de9fc631bd90ffea1&scene=21#wechat_redirect
 
 
 ZooKeeper编程指导
 http://mp.weixin.qq.com/s?__biz=MjM5NzMyMjAwMA==&mid=2651477293&idx=1&sn=fa516d536ef0433eddc5f28fdec1626f&scene=21#wechat_redirect
 */

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
