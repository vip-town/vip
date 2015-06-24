//
//  RegViewController.h
//  vip_town
//
//  Created by yanbo on 15/6/12.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegViewController : UIViewController
/**
 *  手机号
 */
@property (weak, nonatomic) IBOutlet UITextField *phoneNum;
/**
 *  验证码
 */
@property (weak, nonatomic) IBOutlet UITextField *messageNum;

@end
