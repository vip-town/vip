//
//  vip_town.h
//  vip_town
//
//  Created by 王旭 on 15/5/19.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#ifndef vip_town_vip_town_h
#define vip_town_vip_town_h

#define kSCREENH [UIScreen mainScreen].bounds.size.height
#define kSCREENW [UIScreen mainScreen].bounds.size.width

#define KRGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:(a)/1.f]

/*接口定义*/

#pragma mark 实用小工具
#define kUserDef [NSUserDefaults standardUserDefaults]
#define kNotification [NSNotificationCenter defaultCenter]
#define kFileManager  [NSFileManager defaultManager]



#endif
