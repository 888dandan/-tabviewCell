//
//  ContentModel.h
//  自定义tabviewCell
//
//  Created by 曹轩 on 2017/11/12.
//  Copyright © 2017年 曹轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContentModel : NSObject
@property (nonatomic, copy) NSString *text; // 内容
@property (nonatomic, copy) NSString *icon; // 头像
@property (nonatomic, copy) NSString *name; // 昵称
@property (nonatomic, copy) NSString *picture; // 配图
//@property (nonatomic, assign) BOOL vip;

-(id)initWithDict:(NSDictionary*)dict;
+(id)weiboWithDict:(NSDictionary*)dict;
@end
