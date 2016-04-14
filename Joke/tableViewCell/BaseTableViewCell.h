//
//  BaseTableViewCell.h
//  Joke
//
//  Created by wenjuan on 16/4/7.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILabel+StringFrame.h"

@interface BaseTableViewCell : UITableViewCell
@property (nonatomic, strong) UIView *bgView;

- (CGFloat)returnCellHeight;
@end
