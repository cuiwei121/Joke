//
//  WeiXinResponse.m
//  Joke
//
//  Created by wenjuan on 16/4/8.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "WeiXinResponse.h"

@implementation WeiXinListModel

@end

/*
 
 {
 "error_code" = 0;
 reason = success;
 result =     {
 list =         (
 {
 firstImg = "";
 id = "wechat_20160523050700";
 mark = "";
 source = "CSDN\U5927\U6570\U636e";
 title = "\U8fd0\U884c\U4e8e\U4e91\U7aef\U7684Hadoop\U6570\U636e\U5373\U670d\U52a1\U7684\U8bba\U8bc1";
 url = "http://v.juhe.cn/weixin/redirect?wid=wechat_20160523050700";
 },
 {
 firstImg = "http://zxpic.gtimg.com/infonew/0/wechat_pics_-5624605.jpg/640";
 id = "wechat_20160523050703";
 mark = "";
 source = "CSDN\U5927\U6570\U636e";
 title = "\U9ad8\U5e76\U53d1\U91d1\U878d\U5e94\U7528\U67b6\U6784\U4f18\U5316\U4e0e\U5e73\U53f0\U521b\U65b0";
 url = "http://v.juhe.cn/weixin/redirect?wid=wechat_20160523050703";
 },
 {
 firstImg = "http://zxpic.gtimg.com/infonew/0/wechat_pics_-5624607.jpg/640";
 id = "wechat_20160523050702";
 mark = "";
 source = "CSDN\U5927\U6570\U636e";
 title = "Go\U8bed\U8a00\U5b9e\U8df5\Uff1a\U4ece\U65b0\U624b\U5165\U95e8\U5230\U4e0a\U7ebf\U771f\U5b9e\U7684\U5c0f\U578b\U670d\U52a1\U6240\U9047\U5230\U7684\U90a3\U4e9b\U5751";
 url = "http://v.juhe.cn/weixin/redirect?wid=wechat_20160523050702";
 },

 */

@implementation WeiXinResultModel
+(Class)list_class {
    return [WeiXinListModel class];
}
@end


@implementation WeiXinResponse

@end
