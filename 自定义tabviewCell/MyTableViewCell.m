
//
//  MyTableViewCell.m
//  自定义tabviewCell
//
//  Created by 曹轩 on 2017/11/12.
//  Copyright © 2017年 曹轩. All rights reserved.
//

#import "MyTableViewCell.h"
#import "ContentModel.h"
#define NJNameFont [UIFont systemFontOfSize:15]
#define NJTextFont [UIFont systemFontOfSize:16]

@interface MyTableViewCell ()
/**
 10  *  头像
 11  */
@property (nonatomic, weak) UIImageView *iconView;

@property (nonatomic, weak) UIImageView *pictureView;
/**
 22  *  昵称
 23  */
@property (nonatomic, weak) UILabel *nameLabel;
/**
 26  *  正文
 27  */
@property (nonatomic, weak) UILabel *introLabel;


@end

@implementation MyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+(instancetype)cellwithTableview:(UITableView*)tableview{
    
    static  NSString *indentifier=@"staus";
    //缓存中取
    MyTableViewCell *cell=[tableview dequeueReusableCellWithIdentifier:indentifier];
    if (cell==nil) {
        //创建
        cell=[[MyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    return cell;
}

/**
 48  *  构造方法(在初始化对象的时候会调用)
 49  *  一般在这个方法中添加需要显示的子控件
 50  */

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
 {
         self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
       if (self) {
                // 让自定义Cell和系统的cell一样, 一创建出来就拥有一些子控件提供给我们使用
                // 1.创建头像
                UIImageView *iconView = [[UIImageView alloc] init];
                [self.contentView addSubview:iconView];
                self.iconView = iconView;
        
                // 2.创建昵称
                UILabel *nameLabel = [[UILabel alloc] init];
                nameLabel.font = NJNameFont;
              // nameLabel.backgroundColor = [UIColor redColor];
                [self.contentView addSubview:nameLabel];
                self.nameLabel = nameLabel;
           
                // 3.创建正文
                 UILabel *introLabel = [[UILabel alloc] init];
                 introLabel.font = NJTextFont;
                 introLabel.numberOfLines = 0;
                 [self.contentView addSubview:introLabel];
                 self.introLabel = introLabel;
        
                 // 4.创建配图
                  UIImageView *pictureView = [[UIImageView alloc] init];
                  [self.contentView addSubview:pictureView];
                  self.pictureView = pictureView;
           
            }
        return self;
    }

-(void)setContModel:(ContentModel *)ContModel{
    // 不能用点语法 避免循环引用
    _ContModel=ContModel;
    
    // 1.给子控件赋值数据
    [self settingData];
    // 2.设置frame
    [self settingFrame];

}

-(void)settingData{
    
        // 设置头像
         self.iconView.image = [UIImage imageNamed:_ContModel.icon];
        // 设置昵称
        self.nameLabel.text = _ContModel.name;
    
        self.introLabel.text=_ContModel.text;
    
    if (_ContModel.picture!=nil) {
        
        self.pictureView.image=[UIImage imageNamed:_ContModel.picture];
    }
    
}

-(void)settingFrame{
    
    self.iconView.frame=CGRectMake(2, 2, 40, 40);
    self.nameLabel.frame=CGRectMake(50, 2, 200, 40);
    self.introLabel.frame=CGRectMake(2, 42, 300,300);
    // 自主计算高度
    [self.introLabel sizeToFit];

self.cellHeight=self.iconView.frame.origin.x+self.iconView.frame.size.height+self.introLabel.frame.size.height;
    if (_ContModel.picture!=nil) {
        
        self.pictureView.frame=CGRectMake(2, self.introLabel.frame.size.height+self.introLabel.frame.origin.y,self.contentView.frame.size.width-4,self.pictureView.image.size.height )
        ;
        self.cellHeight+=self.pictureView.frame.size.height;
    }
}

- (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize
    {
        NSDictionary *dict = @{NSFontAttributeName : font};
         // 如果将来计算的文字的范围超出了指定的范围,返回的就是指定的范围
         // 如果将来计算的文字的范围小于指定的范围, 返回的就是真实的范围
         CGSize size =  [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
         return size;
     }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
