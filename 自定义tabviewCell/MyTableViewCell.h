//
//  MyTableViewCell.h
//  自定义tabviewCell
//
//  Created by 曹轩 on 2017/11/12.
//  Copyright © 2017年 曹轩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentModel.h"
@interface MyTableViewCell : UITableViewCell

@property(nonatomic,strong) ContentModel *ContModel;
@property(nonatomic,assign)  float  cellHeight;

+(instancetype)cellwithTableview:(UITableView*)tableview;

@end
