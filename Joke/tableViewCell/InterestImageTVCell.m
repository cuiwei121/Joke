//
//  InterestImageTVCell.m
//  Joke
//
//  Created by wenjuan on 16/4/8.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "InterestImageTVCell.h"

@implementation InterestImageTVCell

-  (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.bgView.backgroundColor = [UIColor whiteColor];
        
        _interestImageV = [[UIImageView alloc]init];
        [self.contentView addSubview:_interestImageV];
        [_interestImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(5);
            make.centerX.equalTo(self.contentView);
            make.height.width.equalTo(@(SCREEN_WIDTH/3));
        }];
        
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.font = cwFont(15);
        _contentLabel.numberOfLines = 0;
        [self.contentView addSubview:_contentLabel];
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).with.insets(UIEdgeInsetsMake(5 + SCREEN_WIDTH/3, 15, 45, 15));
        }];
        
        _selectButton = [[UIButton alloc]init];
        [self.contentView addSubview:_selectButton];
        [_selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.equalTo(_interestImageV);
        }];
        
    }
    return self;
}
- (CGFloat)returnCellHeight {
    CGSize size = [self.contentLabel boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 30, 0)];
    CGFloat h = size.height + 60 + SCREEN_WIDTH/3;
    return h;
}
@end
