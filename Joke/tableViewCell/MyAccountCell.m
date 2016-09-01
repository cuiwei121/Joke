//
//  MyAccountCell.m
//  Joke
//
//  Created by wenjuan on 16/5/26.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "MyAccountCell.h"

@implementation MyAccountCell

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
    self.bgView.hidden = YES;
    
    UIView *bgView = [[UIView alloc]init];
    [self.contentView addSubview:bgView];
    bgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 50);
    bgView.backgroundColor = [UIColor whiteColor];
    
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.frame = CGRectMake(15, 0, SCREEN_WIDTH, 50);
    [self.contentView addSubview:_titleLabel];
    _titleLabel.font = cwFont(18);
    _titleLabel.layer.cornerRadius = 0;
    
    _arrowImageV = [[UIImageView alloc]init];
    _arrowImageV.frame = CGRectMake(SCREEN_WIDTH - 35, 15, 20, 20);
    [self.contentView addSubview:_arrowImageV];
    _arrowImageV.image = [UIImage imageNamed:@"bottomArrow"];
    
    _lineView = [[UIView alloc]init];
    _lineView.backgroundColor = [UIColor lightGrayColor];
    _lineView.frame = CGRectMake(0, 49, SCREEN_WIDTH, 1);
    [self.contentView addSubview:_lineView];
}


- (CGFloat)returnCellHeight {
    return 50;
}

@end
