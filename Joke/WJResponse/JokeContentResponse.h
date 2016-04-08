//
//  JokeContentResponse.h
//  Joke
//
//  Created by wenjuan on 16/4/7.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "WJBaseModel.h"
/*
 
 "error_code" = 0;
 reason = Success;
 result =     {
 data =         (
 {
 content = "\U4e2d\U5348\U6ca1\U4e8b\U505a\U966a\U8001";
 hashId = e81fc741c82e0ab68daa352b5e2cb3c6;
 unixtime = 1460013230;
 updatetime = "2016-04-07 15:13:50";
 },

 */
@interface JokeContentDataModel : Jastor
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *hashId;
@property (nonatomic, strong) NSString *unixtime;
@property (nonatomic, strong) NSString *updatetime;

//趣图
@property (nonatomic, strong) NSString *url;

@end


@interface JokeContentResultModel : Jastor
@property (nonatomic, strong) NSArray *data;
+(Class)data_class;
@end


@interface JokeContentResponse : WJBaseModel
@property (nonatomic, strong) JokeContentResultModel *result;
@end
