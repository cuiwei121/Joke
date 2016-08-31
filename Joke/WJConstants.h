//
//  WJConstants.h
//  JuanJoke
//
//  Created by wenjuan on 16/3/30.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJConstants : NSObject
#ifdef __OBJC__

#define SCREEN_SCALE [[UIScreen mainScreen] bounds].size.width / 375.0
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH_PIX ([[UIScreen mainScreen] bounds].size.width == 320 ? 640 : ([[UIScreen mainScreen] bounds].size.width == 375 ? 750 : 1242))
#define URL_PREFIX @"http://japi.juhe.cn/"

/**
 * 对self的弱引用
 */
#define kWeakSelf typeof(self) __weak weakSelf =self

/**
 * NSLog
 */
#ifdef DEBUG
#define LOG(...) NSLog(__VA_ARGS__)
#else
#define LOG(...);
#endif

/**
 * 屏幕的宽度和高度
 */
#define MAutoScale /375.*SCREEN_WIDTH
#define MAS MAutoScale
#define ASX(x)  SCREEN_WIDTH <375 ? x MAS : x

/**
 *内容字体格式
 * HYWaWaZhuanJ //娃娃篆体
 * -- 或 ??????®¨°È®™?°Í??? //游狼锋芒简体
 *Kaiti SC //田氏保钓体
 
 */
#define cwFont(x)  [UIFont fontWithName:@"Kaiti SC" size:x] //[UIFont systemFontOfSize:x]

/**
 *title 字体格式
 */
#define TitleFont  [UIFont fontWithName:@"HYWaWaZhuanJ" size:20]

/**
 *  搞笑文章的内容间距 字体大小
 */
#define ContentFontSpace 10
#define WXContentFontSpace 5
#define contentFontSize 18

/**
 *  灰色字体 和 灰色线的颜色
 */
#define cwGreyColor  [UIColor colorWithRed:(195 / 255.0f) green:(195 / 255.0f) blue:(195/ 255.0f) alpha:1]

/**
 * 收藏的数组
 */
#define COLLECT_ARRAY_KEY @"JOKE_CONTENT_ARRAY_COLLECT"

#endif
@end
