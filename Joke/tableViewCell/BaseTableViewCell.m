//
//  BaseTableViewCell.m
//  Joke
//
//  Created by wenjuan on 16/4/7.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-  (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        _bgView= [[UIView alloc]init];
        [self.contentView addSubview:_bgView];
        _bgView.backgroundColor = cwGreyColor;
        _bgView.layer.cornerRadius = 5.0f;
        
        [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).with.insets(UIEdgeInsetsMake(5, 10, 5, 10));
        }];
        
    }
    return self;
}

- (CGFloat)returnCellHeight {
    return 44;
}

@end
