//
//  ContentTVCell.m
//  Joke
//
//  Created by wenjuan on 16/4/7.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "ContentTVCell.h"

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
        UIButton *collectButton = [[UIButton alloc]init];
        [collectButton addTarget:self action:@selector(collectContent:) forControlEvents:UIControlEventTouchUpInside];
        [collectButton setTitle:@"收藏" forState:UIControlStateNormal];
        [self.contentView addSubview:collectButton];
        [collectButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView).offset(-5);
            make.right.equalTo(self.contentView).offset(-30);
            make.width.height.equalTo(@(50));
        }];
        
        shareButton.titleLabel.font = cwFont(20);
        collectButton.titleLabel.font = cwFont(20);
        
        [shareButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [collectButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        
    }
    return self;
}

- (void)collectContent:(UIButton *)sender {
    //userdefault中返回的数组是不可变的， 所以要转换成可变的数组 在赋值给可变数组的变量
    NSMutableArray * collectA =[ [[NSUserDefaults standardUserDefaults] objectForKey:COLLECT_ARRAY_KEY] mutableCopy];
    if (!collectA) {
        collectA = [NSMutableArray array];
    }
    
    if (![collectA containsObject:_contentLabel.text]) {
       [collectA addObject:_contentLabel.text];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:collectA forKey:COLLECT_ARRAY_KEY];
}

- (void)shareImage:(UIButton *)sender {
    LOG(@"分享图片到好友");
    [self getShareImage];
}


- (CGFloat)returnCellHeight {
    
    CGSize size = [self.contentLabel boundingRectWithSize:CGSizeMake((SCREEN_WIDTH - 30)/2, 0)];
    
    int i = size.height / (int)self.contentLabel.font;
    
    CGFloat h = size.height + 60;
    return h;
}




//分享的图片的宽高
- (UIImage *)getShareImage {
    UIView * viewBG =[[UIView alloc]init];
    viewBG.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    //中间的图片
    UIImageView * starImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT/2 - 30, 60, 60)];
    starImageV.image = [UIImage imageNamed:@"h_star_se"];
    [viewBG addSubview:starImageV];
    
    //文本的长度
    CGSize size = [self.contentLabel boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 30, 0)];
    if (size.height > SCREEN_HEIGHT) {
        viewBG.frame = CGRectMake(0, 0, SCREEN_WIDTH, size.height);
    }
    
    UILabel * shareLabel = [[UILabel alloc]init];
    shareLabel.frame = CGRectMake(15, 5, SCREEN_WIDTH - 30, size.height);
    shareLabel.text =[NSString stringWithFormat:@"%@",_contentLabel.text];
    shareLabel.font = cwFont(15);
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
    //UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    return image;
}


@end
