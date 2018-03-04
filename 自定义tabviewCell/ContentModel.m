//
//  ContentModel.m
//  自定义tabviewCell
//
//  Created by 曹轩 on 2017/11/12.
//  Copyright © 2017年 曹轩. All rights reserved.
//

#import "ContentModel.h"

@implementation ContentModel

-(id)initWithDict:(NSDictionary *)dict{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(id)weiboWithDict:(NSDictionary *)dict{
    
    return [[self alloc]initWithDict:dict];
}



@end
