//
//  ForumViewController.m
//  vip_town
//
//  Created by 王旭 on 15/6/23.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#import "ForumViewController.h"
#import "ForumTableViewCell.h"

@interface ForumViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    __weak IBOutlet UIButton *noticeBtn;
    __weak IBOutlet UIButton *circumBtn;
    __weak IBOutlet UIButton *chatBtn;
    __weak IBOutlet UILabel *leftBtn;
    __weak IBOutlet UILabel *middleBtn;
    __weak IBOutlet UILabel *rightBtn;
    __weak IBOutlet UITableView *dataTableView;
}
@end

@implementation ForumViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[CustomTabBarTool shareManager] hideTabbarView:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"论坛公告";
    // Do any additional setup after loading the view from its nib.
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * Cell = @"Cell";
    ForumTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:Cell];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ForumTableViewCell" owner:self options:nil]lastObject];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld",indexPath.row);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
