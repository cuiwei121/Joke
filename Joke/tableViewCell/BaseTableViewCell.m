//
//  BaseTableViewCell.m
//  Joke
//
//  Created by wenjuan on 16/4/7.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "XZColor.h"
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
        self.contentView.backgroundColor = [XZColor backgroudColor];
        
        _bgView= [[UIView alloc]init];
        [self.contentView addSubview:_bgView];
        
        _bgView.layer.cornerRadius = 3;
        _bgView.layer.shadowOffset = CGSizeMake(0, 0);
        _bgView.layer.shadowOpacity = 0.35;
        _bgView.layer.shadowRadius = 3.0;
        _bgView.layer.borderWidth = 0.5/[[UIScreen mainScreen]scale];
        _bgView.layer.borderColor = [XZColor XZgrey52].CGColor;
        
        _bgView.backgroundColor = [UIColor whiteColor];
        
        [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).with.insets(UIEdgeInsetsMake(5, 10, 5, 10));
        }];
        
    }
    return self;
}
@end
