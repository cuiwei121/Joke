//
//  XZColor.h
//  Joke
//
//  Created by gozap on 16/9/1.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XZColor : UIColor
+ (UIColor *)colorWithR255:(NSInteger)red G255:(NSInteger)green B255:(NSInteger)blue A255:(NSInteger)alpha;
+ (UIImage *)createImageWithColor:(UIColor *)color;
+ (UIImage *)createImageWithColor:(UIColor *)color withSize:(CGSize)size;

+ (UIColor *)backgroudColor;
+ (UIColor *)XZBlue_0_122_255;
+ (UIColor *)XZgrey52;
+ (UIColor *)XZgrey85;
@end
