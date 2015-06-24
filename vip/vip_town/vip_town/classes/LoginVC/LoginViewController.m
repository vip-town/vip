//
//  LoginViewController.m
//  vip_town
//
//  Created by yanbo on 15/6/11.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#import "LoginViewController.h"
#import "RegViewController.h"



@interface LoginViewController ()<UITextFieldDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginClick:(UIButton *)sender {
    [self backKeyBoard];
}
- (IBAction)registerClick:(UIButton *)sender {
    [self backKeyBoard];
    RegViewController *regVC = [[RegViewController alloc] init];
    [self.navigationController pushViewController:regVC animated:YES];
}


- (void)backKeyBoard{
    [self.phone resignFirstResponder];
    [self.password resignFirstResponder];
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
