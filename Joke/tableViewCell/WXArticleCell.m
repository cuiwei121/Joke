//
//  WXArticleCell.m
//  Joke
//
//  Created by wenjuan on 16/5/25.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "WXArticleCell.h"
#import "XZColor.h"
@implementation WXArticleCell
-  (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self createView];
    }
    return self;
}
- (void)createView {
    _wxImageView = [[UIImageView alloc]init];
    _wxImageView.layer.cornerRadius = 3;
    [self.contentView addSubview:_wxImageView];
    [_wxImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(15);
        make.top.equalTo(self.contentView).offset(10);
        make.width.equalTo(@100);
        make.height.equalTo(@80);
    }];

    _wxContentLabel = [[UILabel alloc]init];
    _wxContentLabel.font = cwFont(18);
    _wxContentLabel.numberOfLines = 2;
    _wxContentLabel.frame = CGRectMake(120, 10, SCREEN_WIDTH - 135, 80);
    _wxContentLabel.textColor = [XZColor XZgrey85];
    _wxContentLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    _wxContentLabel.text = @"时间的路人c";
   [self.contentView addSubview:_wxContentLabel];
}
- (CGFloat)returnCellHeight {
    return 100;
}
@end
