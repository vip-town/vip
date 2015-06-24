//
//  PhotoCell.m
//  vip_town
//
//  Created by ly on 15/6/23.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#import "housekeepingServersVC.h"
#import "housekeepingServersCell.h"
#import "showView.h"

@interface housekeepingServersVC ()<UITableViewDataSource,UITableViewDelegate>

/** 导航栏右侧item */
@property (nonatomic ,strong)UIButton *appointmentBtn;
/** 自定义tabbleView */
@property (nonatomic ,strong)UITableView *housekeepingServersTabBleView;
/** 展示View */
@property (nonatomic ,strong)showView *showView;
/** 需要保存按钮名称的数据 */
@property (nonatomic ,strong)NSMutableArray *btnArray;

@end

@implementation housekeepingServersVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"家政服务";
    
    _btnArray = [[NSMutableArray alloc]init];
    
    // 自定义导航栏右侧item
    [self setupMyAppointment];
    
    // 选择显示的View
    [self setupShowView];
    
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
#pragma mark -- 选择显示的View
/** 选择显示的View */
- (void)setupShowView
{
    _showView = [[showView alloc]initWithFrame:CGRectMake(0, 0, kSCREENW, 60)WithDataArray:_btnArray];
    [self.view addSubview:_showView];
}
#pragma mark -- 自定义tabbleView
/** 自定义tabbleView */
- (void)setupTabBleView
{
    _housekeepingServersTabBleView = [[UITableView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(_showView.frame), kSCREENW, kSCREENH) style:(UITableViewStylePlain)];
    _housekeepingServersTabBleView.showsVerticalScrollIndicator = NO;
    _housekeepingServersTabBleView.delegate = self;
    _housekeepingServersTabBleView.dataSource = self;
    _housekeepingServersTabBleView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_housekeepingServersTabBleView];
    
}
#pragma mark -- UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"houseCell";
    
    housekeepingServersCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"housekeepingServersCell" owner:self options:nil]lastObject];
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
