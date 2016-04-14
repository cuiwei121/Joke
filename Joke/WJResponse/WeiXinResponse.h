//
//  WeiXinResponse.h
//  Joke
//
//  Created by wenjuan on 16/4/8.
//  Copyright © 2016年 wenjuan. All rights reserved.
//

#import "WJBaseModel.h"

@interface WeiXinListModel : Jastor
@property (nonatomic, strong) NSString *firstImg;
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *mark;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *url;

@end


@interface WeiXinResultModel : Jastor
@property (nonatomic, strong) NSArray *list;
+(Class)list_class;

@end


@interface WeiXinResponse : WJBaseModel
@property (nonatomic, strong) WeiXinResultModel  *result;

@end
