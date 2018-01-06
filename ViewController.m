//
//  ViewController.m
//  ChatBoard
//
//  Created by Mr Qian on 16/5/10.
//  Copyright © 2016年 Mr Qian. All rights reserved.
//

#import "ViewController.h"
#import "CommentCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"表情键盘";
    
    self.arrayData = [NSMutableArray array];//数据源
    [self.arrayData addObject:@"你的[em_4]"];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-49.5) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
    
    
    /**
     表情键盘使用说明：
     (1). 必须配置EmojiViewHeader.pch到工程中；
     (2). 表情键盘必须贴到视图控制器里；
     */
   
    self.chatKeyBoardView = [[ChatKeyBoardView alloc]initWithDelegate:self superView:self.view];
    self.chatKeyBoardView.frame = CGRectMake(0,CGRectGetHeight(self.view.bounds)-49.5,self.view.bounds.size.width, CGRectGetHeight(self.view.bounds)+0.5);
    
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//表格视图的数据原委托
#pragma mark - UITableViewDataSource

//设置表格视图每一组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.arrayData && [self.arrayData count]) {
        return [self.arrayData count];
    }
    
    return 0;
}

//设置表格视图每一行显示的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"myCell";//定义一个可重用标识
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[CommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
    }
    
    //设置cell文本里的文本内容
    if (self.arrayData && indexPath.row < [self.arrayData count]) {
        [cell setCellWithInfo:self.arrayData[indexPath.row]];
    }
    
    return cell;
}

//表格视图的代理委托
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CommentCell *cell = (CommentCell*)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.height;
}

#pragma mark - ChatKeyBoardViewDelegate
//发送消息
-(void)keyBoardView:(ChatKeyBoardView*)keyBoard sendMessage:(NSString*)message {
    if (message && message.length > 0) {//登录成功后，才能发送消息
        [self.arrayData addObject:message];
        [self.tableView reloadData];
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.arrayData.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];//滑动到tableview 的最底部
    } else {
        NSLog(@"评论内容不能为空");
    }
}

@end
