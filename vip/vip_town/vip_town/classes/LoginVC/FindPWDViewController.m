//
//  FindPWDViewController.m
//  vip_town
//
//  Created by yanbo on 15/6/16.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#import "FindPWDViewController.h"

@interface FindPWDViewController ()<UITextFieldDelegate>
/**
 *  手机号
 */
@property (weak, nonatomic) IBOutlet UITextField *phoneNum;
/**
 *  验证码
 */
@property (weak, nonatomic) IBOutlet UITextField *codeNum;

@end

@implementation FindPWDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)sendMessage:(UIButton *)sender {
    [self backKeyBoard];
}
- (IBAction)nextBtnClick:(UIButton *)sender {
    [self backKeyBoard];
}

- (void)backKeyBoard{
    [self.phoneNum resignFirstResponder];
    [self.codeNum resignFirstResponder];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self backKeyBoard];
    [self.view endEditing:YES];
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
