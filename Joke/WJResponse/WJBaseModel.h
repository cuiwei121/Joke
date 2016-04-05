//
//  WJBaseModel.h
//  JuanJoke
//
//  Created by wenjuan on 16/3/31.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import <jastor/jastor.h>

@interface WJBaseModel : Jastor

@property (nonatomic, strong) NSString *reason;
@property (nonatomic, assign) int error_code;

@end
