//
//  FindPWDNextViewController.m
//  vip_town
//
//  Created by yanbo on 15/6/16.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#import "FindPWDNextViewController.h"

@interface FindPWDNextViewController ()<UITextFieldDelegate>

/**
 *  新密码
 */
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
/**
 *  重复密码
 */
@property (weak, nonatomic) IBOutlet UITextField *repPWDTF;

@end

@implementation FindPWDNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)sureBtnClick:(UIButton *)sender {
    [self backKeyBoard];
}

- (void)backKeyBoard{
    [self.pwdTextField resignFirstResponder];
    [self.repPWDTF resignFirstResponder];
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
