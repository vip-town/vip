//
//  ShoppingViewController.m
//  vip_town
//
//  Created by 王旭 on 15/6/7.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#import "ShoppingViewController.h"
#import "ShoppingCell.h"

@interface ShoppingViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    __weak IBOutlet UITableView *goodListTableView;
}
@end

@implementation ShoppingViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[CustomTabBarTool shareManager] hideTabbarView:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([goodListTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [goodListTableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([goodListTableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [goodListTableView setLayoutMargins:UIEdgeInsetsZero];
    }
//    [self loadGoodsListData];
    // Do any additional setup after loading the view from its nib.
}

- (void)loadGoodsListData {
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * Cell = @"Cell";
    ShoppingCell * cell = [tableView dequeueReusableCellWithIdentifier:Cell];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ShoppingCell" owner:self options:nil] lastObject];
    }
    tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    return cell;
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
