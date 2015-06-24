//
//  ContactUsViewController.m
//  vip_town
//
//  Created by 王旭 on 15/5/19.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#import "ContactUsViewController.h"

@interface ContactUsViewController ()<UIAlertViewDelegate>
/**
 *  联系客服
 */
@property (weak, nonatomic) IBOutlet UIImageView *serviceImageView;
/**
 *  商家合作
 */
@property (weak, nonatomic) IBOutlet UIImageView *teamWorkImageView;
/**
 *  广告传媒
 */
@property (weak, nonatomic) IBOutlet UIImageView *adImageView;
/**
 *  合伙加盟
 */
@property (weak, nonatomic) IBOutlet UIImageView *joinImageView;

/**
 *  底层的scrollView
 */
@property (weak, nonatomic) IBOutlet UIScrollView *scrollerView;

@end

@implementation ContactUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"联系我们";
    

    // Do any additional setup after loading the view from its nib.
}

- (IBAction)callPhone:(UIButton *)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"拨打电话" message:@"即将拨打电话\n400-404-4000" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    NSLog(@"%@",alertView.subviews);
    [alertView show];
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        
        NSLog(@"确定");
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[[NSMutableString alloc] initWithFormat:@"telprompt://%@",@"400-404-4000"]]];
        
        
    } else {
        NSLog(@"quxiap");
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
