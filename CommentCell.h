//
//  CommentCell.h
//  ChatBoard
//
//  Created by Mr Qian on 16/5/10.
//  Copyright © 2016年 Mr Qian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentCell : UITableViewCell

@property (nonatomic) CGFloat height;//cell的高度

- (void)setCellWithInfo:(NSString*)str;

@end
