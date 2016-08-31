//
//  JBaseVC.h
//  Joke
//
//  Created by wenjuan on 16/4/5.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

/*
 字体 http://sc.jb51.net/ziti/
 */

#import <UIKit/UIKit.h>
@class GADBannerView;

@interface JBaseVC : UIViewController

@property (nonatomic, strong) GADBannerView *bannerView;

@property (nonatomic, strong) UISegmentedControl *segment;

/**
 * 创建titleView
 */
- (void)createTitleView;

/**
 *创建自定义Title
 */
- (void)createTittleFont:(NSString *)title;

/**
 * 按钮的点击事件
 */
-(void)change:(UISegmentedControl *)Seg;

/**
 * 我的里面的内容
 */
- (void)myAccountClick:(UIButton *)sender;

/**
 * 设置tabbar  navigationItem
 */
- (void)setNavigationButton;


@end
