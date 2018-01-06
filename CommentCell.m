//
//  CommentCell.m
//  ChatBoard
//
//  Created by Mr Qian on 16/5/10.
//  Copyright © 2016年 Mr Qian. All rights reserved.
//

#import "CommentCell.h"
#import "BubbleView.h"

@implementation CommentCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCellWithInfo:(NSString*)str {
    self.height = 0;
    [self.contentView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
        obj = nil;
    }];
    
    //评论内容视图
    UIView *v = [[BubbleView bubble] bubbleText:str width:kScreenWidth];
    
    v.frame = CGRectMake(10, self.height, kScreenWidth-20, v.frame.size.height);
    [self.contentView addSubview:v];
    self.height += v.frame.size.height+5;
}

@end
