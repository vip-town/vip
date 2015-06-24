//
//  FinishApporationVC.m
//  vip_town
//
//  Created by 李毅 on 15/6/23.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#import "FinishApporationVC.h"
#import "HomePageViewController.h"

@interface FinishApporationVC ()

@end

@implementation FinishApporationVC

- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [[CustomTabBarTool shareManager] hideTabbarView:YES];
}
- (IBAction)backFirstItem:(UIButton *)sender
{
    HomePageViewController *homeVC = [[HomePageViewController alloc]init];
    [self.navigationController pushViewController:homeVC animated:YES];
}
@end
