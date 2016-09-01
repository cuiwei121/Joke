//
//  MyAccountCell.m
//  Joke
//
//  Created by wenjuan on 16/5/26.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "MyAccountCell.h"
#import "XZColor.h"

@implementation MyAccountCell

-  (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self createView];
    }
    return self;
}
- (void)createView {
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    _titleLabel = [[UILabel alloc]init];
    [self.contentView addSubview:_titleLabel];
    _titleLabel.font = cwFont(18);
    _titleLabel.textColor = [XZColor XZgrey85];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(15);
        make.centerY.equalTo(self.contentView);
    }];
    
    _arrowImageV = [[UIImageView alloc]init];
    [self.contentView addSubview:_arrowImageV];
    _arrowImageV.image = [UIImage imageNamed:@"bottomArrow"];
    [_arrowImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10);
        make.centerY.equalTo(self.contentView);
        make.width.height.equalTo(@25);
    }];
    
    _lineView = [[UIView alloc]init];
    _lineView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_lineView];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(1/[[UIScreen mainScreen]scale]));
        make.left.right.bottom.equalTo(self.contentView);
    }];
    
}
@end

@implementation MyAccountVersionCell

-  (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self createView];
    }
    return self;
}

- (void)createView {
    
    self.contentView.backgroundColor = [UIColor whiteColor];

    _titleLabel = [[UILabel alloc]init];
    [self.contentView addSubview:_titleLabel];
    _titleLabel.font = cwFont(18);
    _titleLabel.textColor = [XZColor XZgrey85];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(15);
        make.centerY.equalTo(self.contentView);
    }];
    
    _lineView = [[UIView alloc]init];
    _lineView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_lineView];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(1/[[UIScreen mainScreen]scale]));
        make.left.right.bottom.equalTo(self.contentView);
    }];

    _summeryabel = [[UILabel alloc]init];
    _summeryabel.textAlignment = NSTextAlignmentRight;
    _summeryabel.font = cwFont(16);
    _summeryabel.textColor = [UIColor orangeColor];
    [self.contentView addSubview:_summeryabel];
    [_summeryabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView).offset(-15);
    }];
}
@end

