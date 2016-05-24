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
        self.bgView.backgroundColor = [UIColor whiteColor];
        
        _interestImageV = [[UIImageView alloc]init];
//        _interestImageV.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:_interestImageV];
        CGFloat imageH1 = SCREEN_WIDTH/3;
        [_interestImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(5);
            make.centerX.equalTo(self.contentView);
            make.height.width.equalTo(@(imageH1));
        }];
        
        _contentLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_contentLabel];
        _contentLabel.font = cwFont(15);
        _contentLabel.numberOfLines = 0;
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).with.insets(UIEdgeInsetsMake(5 + imageH1, 15, 45, 15));
        }];
        
        
        _selectButton = [[UIButton alloc]init];
        //        [_selectButton addTarget:self action:@selector(selectButtonClick:) forControlEvents:UIControlEventTouchUpInside];
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
