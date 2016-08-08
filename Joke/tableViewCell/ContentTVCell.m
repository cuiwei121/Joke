//
//  ContentTVCell.m
//  Joke
//
//  Created by wenjuan on 16/4/7.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "ContentTVCell.h"
#import <ShareSDK/ShareSDK.h>

@implementation ContentTVCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-  (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _contentLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_contentLabel];
        _contentLabel.font = cwFont(ContentFontSpace);
        _contentLabel.numberOfLines = 0;
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).with.insets(UIEdgeInsetsMake(5, 15, 45, 15));
        }];
        
        
        //uibutton分享
        UIButton * shareButton = [[UIButton alloc]init];
        [shareButton addTarget:self action:@selector(shareImage:) forControlEvents:UIControlEventTouchUpInside];
        [shareButton setTitle:@"分享" forState:UIControlStateNormal];
        [self.contentView addSubview:shareButton];

        [shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView).offset(-5);
            make.right.equalTo(self.contentView).offset(-80);
            make.width.height.equalTo(@(50));
        }];
        //收藏
        _collectButton = [[UIButton alloc]init];
        [_collectButton addTarget:self action:@selector(collectContent:) forControlEvents:UIControlEventTouchUpInside];
        [_collectButton setTitle:@"收藏" forState:UIControlStateNormal];
        [_collectButton setTitle:@"已收藏" forState:UIControlStateSelected];
 
        [self.contentView addSubview:_collectButton];
        [_collectButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView).offset(-5);
            make.right.equalTo(self.contentView).offset(-20);
            make.height.equalTo(@(50));
            make.width.equalTo(@(60));
        }];
        
 
        shareButton.titleLabel.font = cwFont(18);
        _collectButton.titleLabel.font = cwFont(18);

        
        [shareButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [_collectButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        
    }
    return self;
}

- (void)collectContent:(UIButton *)sender {
    //userdefault中返回的数组是不可变的， 所以要转换成可变的数组 在赋值给可变数组的变量
    LOG(@"收藏");
    NSMutableArray * collectA =[ [[NSUserDefaults standardUserDefaults] objectForKey:COLLECT_ARRAY_KEY] mutableCopy];
    if (!collectA) {
        collectA = [NSMutableArray array];
    }
    
    if (sender.selected) {//已收藏状态
        sender.selected = NO;
        if ([collectA containsObject:_contentLabel.text]) {
            [collectA removeObject:_contentLabel.text];
        }
    }else {
        sender.selected = YES;
        if (![collectA containsObject:_contentLabel.text]) {
            [collectA addObject:_contentLabel.text];
        }
    }
    
//    if (![collectA containsObject:_contentLabel.text]) {
//       [collectA addObject:_contentLabel.text];
//    }
    
    [[NSUserDefaults standardUserDefaults] setObject:collectA forKey:COLLECT_ARRAY_KEY];
}

- (void)shareImage:(UIButton *)sender {
    LOG(@"分享图片到好友");
    
//    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"card"  ofType:@"png"];
    //构造分享内容
    id<ISSContent> publishContent = [ShareSDK content:@"搞笑~~~"
                                       defaultContent:@"默认分享内容测试，没内容时显示"
                                                image:[ShareSDK pngImageWithImage:[self getShareImage]]
                                                title:@"太搞笑了"
                                                  url:@"http://www.xzzai.com"
                                          description:@"笑话都在这里哦！"
                                            mediaType:SSPublishContentMediaTypeImage];
    [ShareSDK showShareActionSheet:nil
                         shareList:nil
                           content:publishContent
                     statusBarTips:YES
                       authOptions:nil
                      shareOptions: nil
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSResponseStateSuccess)
                                {
                                    NSLog(@"分享成功");
                                }
                                else if (state == SSResponseStateFail)
                                {
                                    NSLog(@"分享失败 错误吗：= %d ，错误信息描述 = %@",[error errorCode],[error errorDescription]);
                                }
                            }];
    
//    [self getShareImage];
}


- (CGFloat)returnCellHeight {
    
    CGSize size = [self.contentLabel boundingRectWithSize:CGSizeMake((SCREEN_WIDTH - 30)/2, 0)];
    
    CGFloat h = size.height + 60;
    return h;
}




//分享的图片的宽高
- (UIImage *)getShareImage {
    UIView * viewBG =[[UIView alloc]init];
    viewBG.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    //中间的图片
//    UIImageView * starImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT/2 - 30, 60, 60)];
//    starImageV.image = [UIImage imageNamed:@"h_star_se"];
//    [viewBG addSubview:starImageV];
    
    //文本的长度
    CGSize size = [self.contentLabel boundingRectWithSize:CGSizeMake((SCREEN_WIDTH - 30)/2, 0)];
    if (size.height > SCREEN_HEIGHT) {
        viewBG.frame = CGRectMake(0, 0, SCREEN_WIDTH, size.height);
    }
    
    UILabel * shareLabel = [[UILabel alloc]init];
    shareLabel.frame = CGRectMake(15, 15, SCREEN_WIDTH - 30, size.height);
    shareLabel.text =[NSString stringWithFormat:@"%@",_contentLabel.text];
    shareLabel.font = cwFont(ContentFontSpace);
    shareLabel.numberOfLines = 0;
    [viewBG addSubview:shareLabel];
    
    
    viewBG.backgroundColor = [UIColor lightGrayColor];
    shareLabel.backgroundColor = [UIColor clearColor];
    
    //截图 viewBG截取的图片的大小
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(CGRectGetWidth(viewBG.frame), CGRectGetHeight(viewBG.frame)), NO, 2.0);
    [viewBG.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    //将图片保存到相册中
//    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    return image;
}


@end
