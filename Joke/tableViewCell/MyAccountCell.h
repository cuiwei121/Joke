//
//  MyAccountCell.h
//  Joke
//
//  Created by wenjuan on 16/5/26.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface MyAccountCell : UITableViewCell
@property (nonatomic, strong) UILabel  *titleLabel;
@property (nonatomic, strong) UIImageView *arrowImageV;
@property (nonatomic, strong) UIView *lineView;
@end
@interface MyAccountVersionCell : UITableViewCell
@property (nonatomic, strong) UILabel  *titleLabel;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UILabel  *summeryabel;
@end