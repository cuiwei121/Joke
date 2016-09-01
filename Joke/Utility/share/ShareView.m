//
//  ShareView.m
//  LongDai
//
//  Created by xuzhou on 15/11/24.
//  Copyright © 2015年 Gozap. All rights reserved.

#import "ShareView.h"
#import "ShareHelper.h"
#import "WXApi.h"
#import <TencentOpenAPI/QQApiInterface.h>
#import "WeiboSDK.h"
#import <ShareSDK/ShareSDK.h>
#import <MessageUI/MessageUI.h>
#import<MessageUI/MFMailComposeViewController.h>
#import "AppDelegate.h"

@implementation ShareView{
    UIView * backGroundView;
    UIView * panelView;
    NSMutableArray  * _btnTitle;
    NSMutableArray  * _btnImage;
}
-(void)setup{
    
    [self setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    backGroundView =[UIView new];
    backGroundView.backgroundColor=[UIColor blackColor];
    [self addSubview:backGroundView];
    backGroundView.alpha=0;
    UITapGestureRecognizer * tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cancelClick:)];
    [backGroundView addGestureRecognizer:tap];
    [backGroundView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.left.bottom.right.equalTo(self);
    }];
    panelView =[[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 80)];
    panelView.backgroundColor=[UIColor whiteColor];
    panelView.layer.cornerRadius=5;
    panelView.layer.masksToBounds=YES;
    [self addSubview:panelView];

    
    UIImageView  * _bottomSep,* _oneCenterXSep ,*_twoCenterXSep,* _threeSep;
    _bottomSep =[UIImageView new];
//    _bottomSep.image=[UIImage imageNamed:@"fenxiang_pengyouquan"];
    [panelView addSubview:_bottomSep];
    [_bottomSep mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(panelView);
        make.left.right.equalTo(panelView);
        make.height.equalTo(@(0.5));
    }];
    
    _oneCenterXSep =[UIImageView new];
//    _oneCenterXSep.image=[UIImage imageNamed:@"fenxiang_pengyouquan"];
    [panelView addSubview:_oneCenterXSep];
    [_oneCenterXSep mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(panelView).offset(SCREEN_WIDTH*0.25);
        make.top.bottom.equalTo(panelView);
        make.width.equalTo(@(0.5));
    }];
    
    _twoCenterXSep =[UIImageView new];
//    _twoCenterXSep.image=[UIImage imageNamed:@"fenxiang_pengyouquan"];
    [panelView addSubview:_twoCenterXSep];
    [_twoCenterXSep mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerX.equalTo(panelView);
        make.top.bottom.equalTo(panelView);
        make.width.equalTo(@(0.5));
    }];
    
    _threeSep =[UIImageView new];
//    _threeSep.image=[UIImage imageNamed:@"fenxiang_pengyouquan"];
    [panelView addSubview:_threeSep];
    [_threeSep mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(panelView).offset(-SCREEN_WIDTH*0.25);
        make.top.bottom.equalTo(panelView);
        make.width.equalTo(@(0.5));
    }];
    _btnTitle =[NSMutableArray new];
    _btnImage =[NSMutableArray new];
    //判断安装微信
    if ([WXApi isWXAppInstalled]) {
        [_btnTitle addObject:@"微信好友"];
        [_btnImage addObject:@"fenxiang_weixin"];
        [_btnTitle addObject:@"朋友圈"];
        [_btnImage addObject:@"fenxiang_pengyouquan"];
        [_btnTitle addObject:@"微信收藏"];
        [_btnImage addObject:@"fenxiang_shoucang"];
    }
    //判断QQ
    if ([QQApiInterface isQQInstalled]) {
        [_btnTitle addObject:@"QQ"];
        [_btnImage addObject:@"fenxiang_QQ"];
//        [_btnTitle addObject:@"QQ空间"];
//        [_btnImage addObject:@"UMS_qzone_icon"];
    }
//    //判断微博
//    if ([WeiboSDK isWeiboAppInstalled]) {
//        [_btnTitle addObject:@"微博"];
//        [_btnImage addObject:@"UMS_sina_icon"];
//    }
//    [_btnTitle addObject:@"短信"];
//    [_btnImage addObject:@"UMS_sms_icon"];
//    //判断设置邮箱
//    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
//    BOOL isEmail = [mailClass canSendMail];
//    if (isEmail) {
//        [_btnTitle addObject:@"邮箱"];
//        [_btnImage addObject:@"UMS_email_icon"];
//    }
    int  m=0;
    NSMutableArray * btnArray =[NSMutableArray new];
    for (int i =0 ; i<_btnTitle.count; i++) {
        int ah = m/4;
        int aswitch =(m++)%4;
        UIView * panel=[UIView new];
        [panelView addSubview:panel];
        [panel mas_makeConstraints:^(MASConstraintMaker *make){
            make.width.equalTo(panelView).multipliedBy(0.25);
            make.height.equalTo(@70);
            make.top.equalTo(panelView).offset(ah*70);
            if(aswitch==0)
                make.left.equalTo(panelView);
            else if(aswitch==1)
                make.right.equalTo(panelView.mas_centerX);
            else if(aswitch==2)
                make.left.equalTo(panelView.mas_centerX);
            else
                make.right.equalTo(panelView);
        }];
        ShareTypeLabelBtn * btn =[ShareTypeLabelBtn new];
        btn.label.text=[_btnTitle objectAtIndex:i];
        btn.label.font=[UIFont systemFontOfSize:13];
        [btn.btn setImage:[UIImage imageNamed:[_btnImage objectAtIndex:i]] forState:UIControlStateNormal];
        [panel addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make){
            make.width.equalTo(@70);
            make.height.equalTo(@75);
            make.centerY.centerX.equalTo(panel);
        }];
        btn.userInteractionEnabled=YES;
        btn.tag=i+1111;
        [btn addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(shareClick:)]];
        [btnArray addObject:btn];
    }
}
-(void)cancelClick:(id)sender{
    [self RemoveFromWindowAnimated:YES];
}
-(void)didChangeCapyForFriend{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = self.content;
//    [SVProgressHUD showSuccessWithStatus:@"复制成功"];
}
-(void)shareClick:(UITapGestureRecognizer *)tapView{
    NSString * titleSte = _btnTitle[tapView.view.tag-1111];
    if ([titleSte isEqualToString:@"微信好友"]) {
         [self share:ShareTypeWeixiSession];
    }
    if ([titleSte isEqualToString:@"朋友圈"]) {
        [self share:ShareTypeWeixiTimeline];
    }
    if ([titleSte isEqualToString:@"微信收藏"]) {
         [self share:ShareTypeWeixiFav];
    }
    if ([titleSte isEqualToString:@"QQ"]) {
        [self share:ShareTypeQQ];
    }
    if ([titleSte isEqualToString:@"QQ空间"]) {
        [self share:ShareTypeQQSpace];
    }if ([titleSte isEqualToString:@"微博"]) {
        [self share:ShareTypeSinaWeibo];
    }
    if ([titleSte isEqualToString:@"短信"]) {
        [self share:ShareTypeSMS];
    }
    if ([titleSte isEqualToString:@"邮箱"]) {
        [self share:ShareTypeMail];
    }
}
-(void)share:(ShareType)type{
//    [ShareHelper sharePlatformType:type content:_content image:_image title:_title url:_url];
    [ShareHelper shareformType:type content:_content image:_uiimage title:_title url:_url];
    [self RemoveFromWindowAnimated:YES];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}
-(void)showInWindowAnimated:(BOOL)animated{
    AppDelegate * app =(AppDelegate *)[UIApplication sharedApplication].delegate;
    [app.window addSubview:self];
    if(animated){
        CGRect frame =panelView.frame;
        frame.origin.y=SCREEN_HEIGHT-frame.size.height;
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            backGroundView.alpha=0.3;
            panelView.frame=frame;
        } completion:nil];
        
    }
    else{
        
    }
}
-(void)RemoveFromWindowAnimated:(BOOL)animated{
    if(animated){
        kWeakSelf;
        CGRect frame =panelView.frame;
        frame.origin.y=SCREEN_HEIGHT;
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            backGroundView.alpha=0;
            panelView.frame=frame;
        } completion:^(BOOL finished) {
            if(finished){
                [weakSelf removeFromSuperview];
            }
        }];
        
    }
    else{
        backGroundView.alpha=0;
        CGRect frame =panelView.frame;
        frame.origin.y=SCREEN_HEIGHT;
        panelView.frame=frame;
    }
    
}





@end

@implementation ShareTypeLabelBtn
- (instancetype)init
{
    self = [super init];
    if (self) {
        _btn=[UIButton new];
        _btn.titleLabel.font=[UIFont systemFontOfSize:10];
        [_btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [self addSubview:_btn];
        _btn.userInteractionEnabled=NO;
        _label=[UILabel new];
        _label.textColor=[UIColor blueColor];
        _label.font=[UIFont systemFontOfSize:10];
        _label.text=@"weibo";
        [self addSubview:_label];
        
        [_btn mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.left.right.equalTo(self);
            make.height.equalTo(_btn.mas_width);
        }];
        
        [_label mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(_btn.mas_bottom).offset(-15);
            make.centerX.equalTo(_btn);
        }];
    }
    return self;
}
-(void)setSelectedIndex:(NSInteger)selectedIndex animated:(BOOL)animated{
    if(selectedIndex<0)
        selectedIndex=0;
    else if(selectedIndex>_buttonIconArray.count-1)
        selectedIndex=_buttonIconArray.count-1;
    _selectedIndex=selectedIndex;
    if(animated){
        [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.transform=CGAffineTransformMakeScale(1, 0.01);
        } completion:^(BOOL finished) {
            if(finished){
                [_btn setImage:[_buttonIconArray objectAtIndex:selectedIndex] forState:UIControlStateNormal];
                [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    self.transform=CGAffineTransformMakeScale(1, 1);
                } completion:nil];
            }
        }];
    }
    else{
        [_btn setImage:[_buttonIconArray objectAtIndex:selectedIndex] forState:UIControlStateNormal];
    }
}
@end




