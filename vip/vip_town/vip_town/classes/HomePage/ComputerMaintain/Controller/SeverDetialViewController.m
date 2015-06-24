//
//  SeverDetialViewController.m
//  vip_town
//
//  Created by MeiCai_liyi on 15/6/22.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#import "SeverDetialViewController.h"
#import "ConsumerCell.h"
#import "ApporationVC.h"
#import <UIImageView+AFNetworking.h>

@interface SeverDetialViewController ()<UITableViewDataSource,UITableViewDelegate>

// 商品详情btn
@property (nonatomic ,strong)UIButton *detialBtn;
// 用户评价btn
@property (nonatomic ,strong)UIButton *consumerBtn;
// 商品详情line
@property (nonatomic ,strong)UIView *detialBtnLineView;
// 用户评价line
@property (nonatomic ,strong)UIView *consumerBtnLineView;
// 商品详情和用户评价View
@property (nonatomic ,strong)UIView *ShopDetialAndConsumerJudgeView;
// 商品详情BigView
@property (nonatomic ,strong)UIView *detialBigView;
// 用户评价BigView
@property (nonatomic ,strong)UITableView *consumerBigView;
// 存储广告的数据
@property (nonatomic ,strong)NSMutableArray *advertisementArray;
// 定时器
@property (nonatomic, weak) NSTimer *timer;

@end

@implementation SeverDetialViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"服务详情";
    
    _advertisementArray = [[NSMutableArray alloc]init];
    
    // 广告
    [self setupAdvertisementView];
    
    // 商品详情和用户评价View
    [self setupShopDetialAndConsumerJudge];
    
    // 收藏提示框
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [[CustomTabBarTool shareManager] hideTabbarView:YES];
}
#pragma mark -- 广告轮播器
- (void)setupAdvertisementView
{
    // 数量
    NSInteger totals = [_advertisementArray count];
    
    CGFloat adImageViewW = _addScrollView.width;
    CGFloat adImageViewH = _addScrollView.height;
    
    for (int index = 0; index < totals; index ++)
    {
        // 创建imageView
        UIImageView *adImageView = [[UIImageView alloc]init];
        [adImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [[_advertisementArray objectAtIndex:index] objectForKey:@"pic_url"]]]];
        adImageView.userInteractionEnabled = NO;
        [_addScrollView addSubview:adImageView];
        
        CGFloat adImageViewX = adImageViewW *(index);
        
        adImageView.frame = CGRectMake(adImageViewX, 0, adImageViewW, adImageViewH);
    }
    
    // 设置scrollview
    _addScrollView.contentSize = CGSizeMake(totals *adImageViewW, adImageViewH);
    _addScrollView.pagingEnabled = YES;
    _addScrollView.showsHorizontalScrollIndicator = NO;
    
    //设置pageControl一共有多少页
    _adPageControl.numberOfPages = totals;
    
}
#pragma mark -- 广告
/** 开始轮播 */
- (void) startPlay
{
    // 创建定时器
    NSTimer *timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(next) userInfo:nil repeats:YES];
    //  添加到运行循环中
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}
/** 停止轮播 */
- (void) stopPlay
{
    //  停止定时器
    [self.timer invalidate];
}
/** 下一张图片 */
- (void)next
{
    CGFloat imgW = _addScrollView.width;
    NSInteger count = [_advertisementArray count];
    NSInteger page = 0;
    if (_adPageControl.currentPage == count - 1)
    {
        page = 0;
    }
    else
    {
        page = _adPageControl.currentPage + 1;
    }
    
    [_addScrollView setContentOffset:CGPointMake(page * imgW, 0) animated:YES];
}
#pragma mark - scrollView的代理
/** 当scrollView滚动的时候 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat imgW = scrollView.width;
    _adPageControl.currentPage = (scrollView.contentOffset.x + imgW * 0.5) / imgW;
}
/** 当用户开始拖动的时候 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopPlay];
}
/**  当用户拖动完毕的时候 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startPlay];
}
#pragma mark -- 商品详情和用户评价View
/** 商品详情和用户评价View */
- (void)setupShopDetialAndConsumerJudge
{
    CGFloat originX = 30.f;
    
    _ShopDetialAndConsumerJudgeView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.bigView1.frame) + 5 , kSCREENW, 36)];
    _ShopDetialAndConsumerJudgeView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_ShopDetialAndConsumerJudgeView];
    
    // 商品详情btn
    _detialBtn = [[UIButton alloc]initWithFrame:CGRectMake(originX, 0, _ShopDetialAndConsumerJudgeView.width *0.5 - (2*originX), _ShopDetialAndConsumerJudgeView.height)];
    [_detialBtn setTitle:@"商品详情" forState:0];
    [_detialBtn setTitleColor:[UIColor grayColor] forState:0];
    _detialBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    _detialBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_ShopDetialAndConsumerJudgeView addSubview:_detialBtn];
    [_detialBtn addTarget:self action:@selector(setupDetialClick) forControlEvents:UIControlEventTouchUpInside];
    
    // 商品详情line
    _detialBtnLineView = [[UIView alloc]initWithFrame:CGRectMake(_detialBtn.x, CGRectGetMaxY(_detialBtn.frame) -2, _detialBtn.width, 2)];
    _detialBtnLineView.backgroundColor = KRGBA(244, 60, 68, 1);
    [_ShopDetialAndConsumerJudgeView addSubview:_detialBtnLineView];
    
    // 商品详情BigView
    [self setupDetialView];
    
    // 用户评价btn
    _consumerBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_detialBtn.frame)+2*originX, 0, _detialBtn.width, _detialBtn.height)];
    [_consumerBtn setTitle:@"用户评价(10)" forState:0];
    [_consumerBtn setTitleColor:[UIColor grayColor] forState:0];
    _consumerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    _consumerBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_ShopDetialAndConsumerJudgeView addSubview:_consumerBtn];
    [_consumerBtn addTarget:self action:@selector(setupConsumerClick) forControlEvents:UIControlEventTouchUpInside];
    
    // 用户评价line
    _consumerBtnLineView = [[UIView alloc]initWithFrame:CGRectMake(_consumerBtn.x, CGRectGetMaxY(_consumerBtn.frame) - 2, _consumerBtn.width, 2)];
    _consumerBtnLineView.backgroundColor = KRGBA(244, 60, 68, 1);
    _consumerBtnLineView.hidden = YES;
    [_ShopDetialAndConsumerJudgeView addSubview:_consumerBtnLineView];
    
    // 用户评价BigView
    [self setupConsumerView];
    
}
/** 商品详情BigView */
- (void)setupDetialView
{
    // 商品详情BigView
    _detialBigView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_ShopDetialAndConsumerJudgeView.frame)+2, kSCREENW,(kSCREENH - CGRectGetMaxY(_ShopDetialAndConsumerJudgeView.frame) - 49 - 64))];
    _detialBigView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_detialBigView];
}
/** 用户评价BigView */
- (void)setupConsumerView
{
    _consumerBigView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_ShopDetialAndConsumerJudgeView.frame)+2, kSCREENW,(kSCREENH - CGRectGetMaxY(_ShopDetialAndConsumerJudgeView.frame) - 49 - 64))];
    _consumerBigView.hidden = YES;
    _consumerBigView.showsVerticalScrollIndicator = NO;
    _consumerBigView.delegate = self;
    _consumerBigView.dataSource = self;
    _consumerBigView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_consumerBigView];
}
/** 商品详情btn */
- (void)setupDetialClick
{
    _detialBtnLineView.hidden = NO;
    _consumerBtnLineView.hidden = YES;
    _detialBigView.hidden = NO;
    _consumerBigView.hidden = YES;
    
}
/** 用户评价btn */
- (void)setupConsumerClick
{
    _consumerBtnLineView.hidden = NO;
    _detialBtnLineView.hidden = YES;
    _detialBigView.hidden = YES;
    _consumerBigView.hidden = NO;
}
#pragma mark -- UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"CELL";
    
    ConsumerCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ConsumerCell" owner:self options:nil]lastObject];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
// 立即预约
- (IBAction)appointmentClick:(UIButton *)sender
{
    ApporationVC *appVC = [[ApporationVC alloc]init];
    [self.navigationController pushViewController:appVC animated:YES];
}
// 收藏
- (IBAction)collectClick:(UIButton *)sender
{
    
}
// 分享
- (IBAction)shareClick:(UIButton *)sender
{
    
}
@end
