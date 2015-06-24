//
//  ApporationVC.m
//  vip_town
//
//  Created by 李毅 on 15/6/22.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#import "ApporationVC.h"
#import "FinishApporationVC.h"

@interface ApporationVC ()

@end

@implementation ApporationVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"预约";
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [[CustomTabBarTool shareManager] hideTabbarView:YES];
}
- (IBAction)chooseAddressClick:(UIButton *)sender
{
}

- (IBAction)finishApporationClick:(UIButton *)sender
{
    FinishApporationVC *finisVC = [[FinishApporationVC alloc]init];
    [self.navigationController pushViewController:finisVC animated:YES];
}
@end
