//
//  InterestImageTVCell.m
//  Joke
//
//  Created by wenjuan on 16/4/8.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "InterestImageTVCell.h"

@implementation InterestImageTVCell

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
        
        _interestImageV = [[UIImageView alloc]init];
        [self.contentView addSubview:_interestImageV];
        CGFloat imageH = SCREEN_WIDTH - 30;
        [_interestImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(5);
            make.centerX.equalTo(self.contentView);
            make.height.width.equalTo(@(imageH));
        }];
        
        _contentLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_contentLabel];
        _contentLabel.font = cwFont(15);
        _contentLabel.numberOfLines = 0;
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).with.insets(UIEdgeInsetsMake(5 + imageH, 15, 45, 15));
        }];
        
        
    }
    return self;
}


- (CGFloat)returnCellHeight {
    
    CGSize size = [self.contentLabel boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 30, 0)];
    
    CGFloat h = size.height + 60 + SCREEN_WIDTH - 30;
    return h;
}


@end
