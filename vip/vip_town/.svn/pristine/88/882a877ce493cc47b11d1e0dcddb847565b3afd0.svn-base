//
//  CustomTabBar.m
//  vip_town
//
//  Created by 王旭 on 15/5/19.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#import "CustomTabBar.h"
#import "ContactUsViewController.h"
#import "HomePageViewController.h"
#import "ShoppingCartViewController.h"
#import "UserCenterViewController.h"
#import "CurseNavigation.h"
#define kTabbarAnimationDuring  0.3f                                   //显示消失的时间
@interface CustomTabBar ()
{
    UIImageView *bgImageView;
}
@end

@implementation CustomTabBar


- (void)viewDidLoad {
    [super viewDidLoad];
    [self customTabBar];
    // Do any additional setup after loading the view.
}

-(void)customTabBar {
    
    DEFINE_CONTROLLER(HomePageViewController, homeNvc);
    
    DEFINE_CONTROLLER(ShoppingCartViewController, shopCartNvc);
    
    DEFINE_CONTROLLER(UserCenterViewController, userNvc);
    
    DEFINE_CONTROLLER(ContactUsViewController, contactNvc);
    
    self.viewControllers = @[homeNvc, shopCartNvc, userNvc, contactNvc];
    
    [self UIConfig];
}

-(void)UIConfig {
    //自定义一个UITabBar步骤
    //1.隐藏系统自带的UITabBar
    self.tabBar.hidden = YES;
    //2.根据产品需求添加tabbar的背景图片
    bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, kSCREENH - 49, kSCREENW, 49)];
    bgImageView.image = [UIImage imageNamed:@"tabbg.png"];
    bgImageView.backgroundColor = KRGBA(100, 100, 100, 1);
    bgImageView.userInteractionEnabled = YES;
    [self.view addSubview:bgImageView];
    //3.根据产品需求在背景图片上添加按钮
    for (int i  = 0; i < 4; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake((kSCREENW/4) * i, 0, kSCREENW/4, 49);
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i+1]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i+1]] forState:UIControlStateHighlighted];
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%ds.png",i+1]] forState:UIControlStateSelected];
//        [btn setTitle:[titleArray objectAtIndex:i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        btn.tag = 100+i;
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        if (btn.tag == 100) {
            btn.selected = YES;
            btn.userInteractionEnabled = NO;
            btn.backgroundColor = KRGBA(70, 70, 70, 1);
        }
        [bgImageView addSubview:btn];
    }
}

-(void)buttonClick:(UIButton *)btn {
    [self selectedIndex:btn.tag - 100];
}

-(void)selectedIndex:(NSInteger)index {
    //4.点击不同的按钮，切换不同的视图控制器
    self.selectedIndex = index;
    
    for (UIView  *view in bgImageView.subviews){
        //判断view是否是UIButton类型
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton *)view;
            if((index + 100) == button.tag)
            {
                button.selected = YES;
                button.userInteractionEnabled = NO;
            } else {
                button.selected = NO;
                button.userInteractionEnabled = YES;
            }
        }
    }
}

-(void)showTabbarView:(BOOL)isAnimate
{
    if (isAnimate)
    {
        if (bgImageView.frame.origin.y == kSCREENH)
        {
            [UIView animateWithDuration:kTabbarAnimationDuring animations:^{
                bgImageView.frame = CGRectMake(0, kSCREENH - bgImageView.frame.size.height, kSCREENW, bgImageView.frame.size.height);
            } completion:^(BOOL finished) {
                
            }];
        }
    }
    else
    {
        if (bgImageView.frame.origin.y == kSCREENH)
        {
            bgImageView.frame = CGRectMake(0, kSCREENH - bgImageView.frame.size.height, kSCREENW, bgImageView.frame.size.height);
        }
    }
}

-(void)hideTabbarView:(BOOL)isAnimate
{
    if (isAnimate)
    {
        if (bgImageView.frame.origin.y != kSCREENH)
        {
            [UIView animateWithDuration:kTabbarAnimationDuring animations:^{
                bgImageView.frame = CGRectMake(0, kSCREENH, kSCREENW, bgImageView.frame.size.height);
            } completion:^(BOOL finished) {
                
            }];
        }
    }
    else
    {
        if (bgImageView.frame.origin.y != kSCREENH)
        {
            bgImageView.frame = CGRectMake(0, kSCREENH, kSCREENW, bgImageView.frame.size.height);
        }
    }
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
