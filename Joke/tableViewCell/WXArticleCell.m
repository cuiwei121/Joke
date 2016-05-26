//
//  WXArticleCell.m
//  Joke
//
//  Created by wenjuan on 16/5/25.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "WXArticleCell.h"

@implementation WXArticleCell

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
        
        [self createView];
    }
    return self;
}


- (void)createView {
    _wxImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:_wxImageView];
    _wxImageView.frame = CGRectMake(15, 10, 100, 80);
    
    _wxContentLabel = [[UILabel alloc]init];
    [self.contentView addSubview:_wxContentLabel];
    _wxContentLabel.font = cwFont(18);
    _wxContentLabel.numberOfLines = 0;
    _wxContentLabel.frame = CGRectMake(120, 10, SCREEN_WIDTH - 135, 80);
    
    
    _wxImageView.image = [UIImage imageNamed:@"h_star_se"];
    _wxContentLabel.text = @"时间的路人c";
}


- (CGFloat)returnCellHeight {
    return 100;
}


@end
