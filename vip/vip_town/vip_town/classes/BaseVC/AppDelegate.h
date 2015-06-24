//
//  AppDelegate.h
//  vip_town
//
//  Created by 王旭 on 15/5/19.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTabBar.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 *  自定义toolBar
 */
@property (strong, nonatomic) CustomTabBar *customTab;

@end

