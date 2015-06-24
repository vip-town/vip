//
//  extraEducationVC.m
//  vip_town
//
//  Created by MeiCai_liyi on 15/6/23.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#import "extraEducationVC.h"
#import "extraEducationTableViewCell.h"


@interface extraEducationVC ()<UITableViewDataSource,UITableViewDelegate>

/** 导航栏右侧item */
@property (nonatomic ,strong)UIButton *appointmentBtn;
/** 自定义tabbleView */
@property (nonatomic ,strong)UITableView *extraEducationTabBleView;

@end

@implementation extraEducationVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"托教补习";
    
    // 自定义导航栏右侧item
    [self setupMyAppointment];
    
    // 自定义tabbleView
    [self setupTabBleView];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [[CustomTabBarTool shareManager] hideTabbarView:YES];
}
#pragma mark -- 自定义导航栏右侧item
/** 我的预约 */
- (void)setupMyAppointment
{
    // 刷新
    _appointmentBtn = [[UIButton alloc] initWithFrame:CGRectMake(0,0,100,30)];
    [_appointmentBtn setTitleColor:[UIColor redColor] forState:0];
    _appointmentBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    _appointmentBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    [_appointmentBtn setTitle:@"         我的预约" forState:0];
    [_appointmentBtn addTarget:self action:@selector(myAppointmentClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *refreshItem = [[UIBarButtonItem alloc] initWithCustomView:_appointmentBtn];
    self.navigationItem.rightBarButtonItem = refreshItem;
}
/** 跳转到预约 */
- (void)myAppointmentClick
{
    NSLog(@"跳转到我的预约");
}
#pragma mark -- 自定义tabbleView
/** 自定义tabbleView */
- (void)setupTabBleView
{
    _extraEducationTabBleView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, kSCREENW, kSCREENH) style:(UITableViewStylePlain)];
    _extraEducationTabBleView.showsVerticalScrollIndicator = NO;
    _extraEducationTabBleView.delegate = self;
    _extraEducationTabBleView.dataSource = self;
    _extraEducationTabBleView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_extraEducationTabBleView];
    
}
#pragma mark -- UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"extraCell";
    
    extraEducationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"extraEducationTableViewCell" owner:self options:nil]lastObject];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SeverDetialViewController *sdVC = [[SeverDetialViewController alloc]init];
    
    [self.navigationController pushViewController:sdVC animated:YES];
}

@end
