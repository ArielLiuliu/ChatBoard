//
//  ViewController.h
//  ChatBoard
//
//  Created by Mr Qian on 16/5/10.
//  Copyright © 2016年 Mr Qian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatKeyBoardView.h"//聊天框

@interface ViewController : UIViewController<ChatKeyBoardViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) ChatKeyBoardView *chatKeyBoardView;
@property (nonatomic, strong) NSMutableArray *arrayData;
@property (nonatomic, strong) UITableView *tableView;
@end

