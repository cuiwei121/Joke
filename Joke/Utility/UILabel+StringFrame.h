//
//  UILabel+StringFrame.h
//  Joke
//
//  Created by wenjuan on 16/4/7.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (StringFrame)
- (CGSize)boundingRectWithSize:(CGSize)size;

//设置行间距
- (void)spaceLabel:(NSInteger)spaceSize ;
@end
