//
//  CustomTabBarTool.m
//  vip_town
//
//  Created by 王旭 on 15/6/23.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#import "CustomTabBarTool.h"

static CustomTabBar * tool;

@implementation CustomTabBarTool

+(void)getTabbarInstance:(id)tabbar
{
    tool = tabbar;
}

+(CustomTabBar *)shareManager
{
    if (tool)
    {
        return (CustomTabBar *)tool;
    }
    return nil;
}

@end
