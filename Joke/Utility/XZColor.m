//
//  XZColor.m
//  Joke
//
//  Created by gozap on 16/9/1.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "XZColor.h"

@implementation XZColor
+ (UIColor *)colorWithR255:(NSInteger)red G255:(NSInteger)green B255:(NSInteger)blue A255:(NSInteger)alpha
{
    return ([UIColor colorWithRed:((CGFloat) red / 255) green:((CGFloat) green / 255) blue:((CGFloat) blue / 255) alpha:((CGFloat) alpha / 255)]);
}
+ (UIImage *)createImageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
+ (UIImage *)createImageWithColor:(UIColor *)color withSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}




+ (UIColor *)backgroudColor {
    return [XZColor colorWithR255:251 G255:250 B255:248 A255:255];
}
+ (UIColor *)XZBlue_0_122_255 {
    return [XZColor colorWithR255:0 G255:122 B255:255 A255:255];
}
+ (UIColor *)XZgrey52 {
    return [XZColor colorWithR255:52 G255:52 B255:52 A255:255];
}
+ (UIColor *)XZgrey85 {
    return [XZColor colorWithR255:85 G255:85 B255:85 A255:255];
}
@end
