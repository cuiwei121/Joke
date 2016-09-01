//
//  ShareView.h
//  LongDai
//
//  Created by xuzhou on 15/11/24.
//  Copyright © 2015年 Gozap. All rights reserved.

#import <UIKit/UIKit.h>
#import <ShareSDK/ShareSDK.h>
@class ShareTypeLabelBtn;
@interface ShareView : UIView
@property(nonatomic,strong)NSString * content;
@property(nonatomic,strong)NSString * image;
@property(nonatomic,strong) UIImage *uiimage;
@property(nonatomic,strong)NSString * title;
@property(nonatomic,strong)NSString * url;
@property(nonatomic,strong)NSString * descriptions;
@property(nonatomic, assign)SSPublishContentMediaType publishContentMediaType;

-(void)showInWindowAnimated:(BOOL)animated;
@end



@interface ShareTypeLabelBtn : UIView
@property(nonatomic,strong)UIButton * btn;
@property(nonatomic,strong)UILabel * label;
@property(nonatomic,strong)NSArray * buttonIconArray;
@property(nonatomic,assign)NSInteger selectedIndex;
-(void)setSelectedIndex:(NSInteger)selectedIndex animated:(BOOL)animated;
@end