//
//  HomePageViewController.m
//  vip_town
//
//  Created by 王旭 on 15/5/19.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#import "HomePageViewController.h"
#import <UIImageView+AFNetworking.h>
#import "HomePageTableViewCell.h"
#import "ShoppingViewController.h"
#import "ForumViewController.h"
#import "InfomationViewController.h"
#import "travelViewController.h"
#import "ComputerMaintainViewController.h"
#import "extraEducationVC.h"
#import "housekeepingServersVC.h"
#import "photoVC.h"
#import "rectVC.h"

@interface HomePageViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    __weak IBOutlet UIView *headerView;
    __weak IBOutlet UIScrollView *adScrView;
    __weak IBOutlet UIView *bgView1;
    __weak IBOutlet UIView *bgView2;
    UIPageControl *pageControl;
    NSMutableArray * adImageViewArray;
    NSMutableArray * dataSourceArray;
}
@end

@implementation HomePageViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[CustomTabBarTool shareManager] showTabbarView:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    adImageViewArray = [[NSMutableArray alloc] init];
    dataSourceArray = [[NSMutableArray alloc] init];
    
    self.navigationItem.titleView = [self createTitleView];
    [self createTitle];
    [self createAdScrollView];
    // Do any additional setup after loading the view from its nib.
}

-(void)createTitle {
    UISearchBar * searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 8, 190, 29)];
    searchBar.placeholder = @"购物送到家";
    searchBar.backgroundColor = [UIColor clearColor];
    [self.navigationItem.titleView addSubview:searchBar];
    
    UIButton * leftView = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftView setFrame:CGRectMake(0, 0, 60, 44)];
    [leftView addTarget:self action:@selector(leftViewAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    btn.frame = CGRectMake(0, 0, 36, 44);
    [btn setTitle:@"青龙县" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(leftViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [leftView addSubview:btn];
    
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.png"]];
    [imageView setFrame:CGRectMake(38, 16, 12, 12)];
    [leftView addSubview:imageView];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftView];
    
    UIButton * rightView = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightView setFrame:CGRectMake(40, 0, 30, 44)];
    [rightView addTarget:self action:@selector(rightViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [rightView setImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightView];
    self.navigationItem.rightBarButtonItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 20);
}

-(void)leftViewAction:(UIButton *)btn {
    NSLog(@"left");
}

-(void)rightViewAction:(UIButton *)btn{
    NSLog(@"right");
}

#pragma mark - 广告循环滚动
- (void)createAdScrollView {
    // 定时器 循环
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(runTimePage) userInfo:nil repeats:YES];
    // 初始化 scrollview
    adScrView.bounces = YES;
    adScrView.pagingEnabled = YES;
    adScrView.delegate = self;
    adScrView.userInteractionEnabled = YES;
    adScrView.showsHorizontalScrollIndicator = NO;
    
    // 创建四个图片 imageview
    for (int i = 0;i<[adImageViewArray count];i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((kSCREENW * i) + kSCREENW, 0, kSCREENW, adScrView.frame.size.height)];
        [imageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [[adImageViewArray objectAtIndex:i] objectForKey:@"pic_url"]]]];
        imageView.userInteractionEnabled = YES;
        [adScrView addSubview:imageView]; // 首页是第0页,默认从第1页开始的。所以+320。。。
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAdImage:)];
        [imageView addGestureRecognizer:tap];
    }
    
    // 取数组最后一张图片 放在第0页
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kSCREENW, adScrView.frame.size.height)];
    [imageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [[adImageViewArray lastObject] objectForKey:@"pic_url"]]]]; // 添加最后1页在首页 循环
    [adScrView addSubview:imageView];
    // 取数组第一张图片 放在最后1页
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake((kSCREENW * ([adImageViewArray count] + 1)) , 0, kSCREENW, adScrView.frame.size.height)];
    [imageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [[adImageViewArray firstObject] objectForKey:@"pic_url"]]]]; // 添加第1页在最后 循环
    [adScrView addSubview:imageView];
    
    [adScrView setContentSize:CGSizeMake(kSCREENW * ([adImageViewArray count] + 2), adScrView.frame.size.height)]; //  +上第1页和第4页  原理：4-[1-2-3-4]-1
    [adScrView setContentOffset:CGPointMake(0, 0)];
    [adScrView scrollRectToVisible:CGRectMake(kSCREENW,0,kSCREENW,adScrView.frame.size.height) animated:NO]; // 默认从序号1位置放第1页 ，序号0位置放第4页
    
    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, adScrView.frame.size.height - 37, kSCREENW, 37)];
    [pageControl setCurrentPageIndicatorTintColor:[UIColor colorWithRed:73/255.f green:176/255.f blue:0/255.f alpha:1.f]];
    [pageControl setPageIndicatorTintColor:[UIColor whiteColor]];
    pageControl.numberOfPages = [adImageViewArray count];
    pageControl.currentPage = 0;
    [pageControl addTarget:self action:@selector(turnPage) forControlEvents:UIControlEventValueChanged]; // 触摸mypagecontrol触发change这个方法事件
    [headerView addSubview:pageControl];
}

// scrollview 委托函数
- (void)scrollViewDidScroll:(UIScrollView *)sender {
    CGFloat pagewidth = adScrView.frame.size.width;
    int page = floor((adScrView.contentOffset.x - pagewidth/([adImageViewArray count]+2))/pagewidth)+1;
    page --;  // 默认从第二页开始
    pageControl.currentPage = page;
}

// scrollview 委托函数
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pagewidth = adScrView.frame.size.width;
    int currentPage = floor((adScrView.contentOffset.x - pagewidth/ ([adImageViewArray count]+2)) / pagewidth) + 1;
    //    int currentPage_ = (int)self.scrollView.contentOffset.x/320; // 和上面两行效果一样
    //    // NSLog(@"currentPage_==%d",currentPage_);
    if (currentPage==0) {
        [adScrView scrollRectToVisible:CGRectMake(kSCREENW * [adImageViewArray count],0,kSCREENW, adScrView.frame.size.height) animated:NO]; // 序号0 最后1页
    } else if (currentPage==([adImageViewArray count]+1)) {
        [adScrView scrollRectToVisible:CGRectMake(kSCREENW,0,kSCREENW, adScrView.frame.size.height) animated:NO]; // 最后+1,循环第1页
    }
}

// pagecontrol 选择器的方法
- (void)turnPage {
    NSInteger page = pageControl.currentPage; // 获取当前的page
    [adScrView scrollRectToVisible:CGRectMake(kSCREENW*(page+1),0,kSCREENW,adScrView.frame.size.height) animated:NO]; // 触摸pagecontroller那个点点 往后翻一页 +1
}

// 定时器 绑定的方法
- (void)runTimePage {
    NSInteger page = pageControl.currentPage; // 获取当前的page
    page++;
    page = page > [adImageViewArray count]- 1 ? 0 : page ;
    pageControl.currentPage = page;
    [self turnPage];
}

//广告点击进入
-(void) tapAdImage:(UITapGestureRecognizer *)tap {
    NSLog(@"%@", tap);
}

#pragma mark - button click
//超市购物&送餐外卖
- (IBAction)buySomething:(UIButton *)sender {
    ShoppingViewController * shop = [[ShoppingViewController alloc] initWithNibName:@"ShoppingViewController" bundle:nil];
    shop.type = sender.tag;
    switch (sender.tag) {
        case 100:
        {
            shop.title = @"超市购物";
        }
            break;
        case 101:
        {
            shop.title = @"送餐外卖";
        }
            break;
            
        default:
            break;
    }
    [self.navigationController pushViewController:shop animated:YES];
}

//代金券
- (IBAction)voucher:(UIButton *)sender {
    NSLog(@"代金券");
}

//论坛、求职、中介、二手市场、二手车市
- (IBAction)information:(UIButton *)sender {
    switch (sender.tag) {
        case 103:
        {
            NSLog(@"论坛");
        }
            break;
        case 104:
        {
            NSLog(@"求职招聘");
        }
            break;
        case 105:
        {
            NSLog(@"房产中介");
        }
            break;
        case 106:
        {
            NSLog(@"二手市场");
        }
            break;
        case 107:
        {
            NSLog(@"二手车市");
        }
            break;
            
        default:
            break;
    }
    if (sender.tag == 103) {
        ForumViewController * forum = [[ForumViewController alloc] initWithNibName:@"ForumViewController" bundle:nil];
        [self.navigationController pushViewController:forum animated:YES];
    } else {
        InfomationViewController * info = [[InfomationViewController alloc] initWithNibName:@"InfomationViewController" bundle:nil];
        info.type = sender.tag;
        [self.navigationController pushViewController:info animated:YES];
    }
}

//电脑、补习、家政、摄影、出租、旅游
- (IBAction)service:(UIButton *)sender {
    switch (sender.tag) {
        case 108:
        {
            NSLog(@"电脑维修");
            ComputerMaintainViewController *computer = [[ComputerMaintainViewController alloc]init];
            [self.navigationController pushViewController:computer animated:YES];
        }
            break;
        case 109:
        {
            NSLog(@"托教补习");
            extraEducationVC *computer = [[extraEducationVC alloc]init];
            [self.navigationController pushViewController:computer animated:YES];
        }
            break;
        case 110:
        {
            NSLog(@"家政服务");
            housekeepingServersVC *computer = [[housekeepingServersVC alloc]init];
            [self.navigationController pushViewController:computer animated:YES];
        }
            break;
        case 111:
        {
            NSLog(@"摄影庆典");
            photoVC *computer = [[photoVC alloc]init];
            [self.navigationController pushViewController:computer animated:YES];
        }
            break;
        case 112:
        {
            NSLog(@"出租捎货");
            rectVC *computer = [[rectVC alloc]init];
            [self.navigationController pushViewController:computer animated:YES];
        }
            break;
        case 113:
        {
            NSLog(@"度假旅游");
            travelViewController * trave = [[travelViewController alloc] init];
            [self.navigationController pushViewController:trave animated:YES];
        }
            break;
            
        default:
            break;
    }
}

//贷款、缴费
- (IBAction)financial:(UIButton *)sender {
    switch (sender.tag) {
        case 114:
        {
            NSLog(@"贷款理财");
        }
            break;
        case 115:
        {
            NSLog(@"水电费代缴");
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - tableView delegate 
//返回cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90.f;
}

//返回cell行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return dataSourceArray.count;
    return 3;
}

//头部视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* header = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, kSCREENW, 50)];
    [header setBackgroundColor:[UIColor colorWithRed:241/255.f green:241/255.f blue:241/255.f alpha:1.f]];
    UILabel * todayLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 60, 24)];
    todayLabel.font = [UIFont systemFontOfSize:14.f];
    todayLabel.text = @"今日特价";
    todayLabel.textColor = [UIColor colorWithRed:105/255.f green:105/255.f blue:105/255.f alpha:1.f];
    [header addSubview:todayLabel];
    return header;
}

//返回头部视图的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

//返回尾部视图的高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

//重绘cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * Cell = @"Cell";
    HomePageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:Cell];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HomePageTableViewCell" owner:self options:nil]lastObject];
    }
    return cell;
}

//cell的选中方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld", indexPath.row);
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
