//
//  UILabel+StringFrame.m
//  Joke
//
//  Created by wenjuan on 16/4/7.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "UILabel+StringFrame.h"

@implementation UILabel (StringFrame)
- (CGSize)boundingRectWithSize:(CGSize)size
{
    NSDictionary *attribute = @{NSFontAttributeName: self.font};
    
    CGSize retSize = [self.text boundingRectWithSize:size
                                             options:
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    
    return retSize;
}




- (void)spaceLabel:(NSInteger)spaceSize {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:spaceSize];//调整行间距
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
    self.attributedText = attributedString;
    
    /*
     
     NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
     paragraphStyle.lineSpacing = 5;// 字体的行间距
     NSDictionary *attributes = @{
     NSFontAttributeName:[UIFont systemFontOfSize:14],
     NSParagraphStyleAttributeName:paragraphStyle
     };
     shareLabel.attributedText = [[NSAttributedString alloc] initWithString:codeTextString attributes:attributes];
     
     */
}


@end
