//
//  ApporationVC.h
//  vip_town
//
//  Created by 李毅 on 15/6/22.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApporationVC : UIViewController
/** 联系人姓名 */
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
/** 联系方式 */
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
/** 详细地址 */
@property (weak, nonatomic) IBOutlet UITextField *detialTextField;
/** 选择地区 */
- (IBAction)chooseAddressClick:(UIButton *)sender;
/** 完成预约*/
- (IBAction)finishApporationClick:(UIButton *)sender;

@end
