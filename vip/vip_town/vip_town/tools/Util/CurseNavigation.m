//
//  CurseNavigation.m
//  vip_town
//
//  Created by yanbo on 15/5/26.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#import "CurseNavigation.h"
#define kNavigationBarColor [UIColor colorWithRed:85.0/255.0 green:186.0/255.0 blue:81.0/255.0 alpha:1.0]
#define kTopNaviTitleFont        19.0f
#define kTopNaviLeftRightFont    18.0f

@implementation CurseNavigation
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationBar setBarTintColor:kNavigationBarColor];
    [self.navigationBar setTranslucent:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(void)initialize
{
    //设置导航栏主题
    [self setNaviScheme];
}

+(void)setNaviScheme
{
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:kTopNaviTitleFont];
    [navBar setTitleTextAttributes:textAttrs];
}
@end
