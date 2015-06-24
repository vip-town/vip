//
//  InfomationViewController.m
//  vip_town
//
//  Created by 王旭 on 15/6/22.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#import "InfomationViewController.h"
#import "InfomationTableViewCell.h"

@interface InfomationViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    __weak IBOutlet UITableView *m_tableView;
    __weak IBOutlet UIButton *leftBtn;
    __weak IBOutlet UIButton *rightBtn;
    __weak IBOutlet UILabel *leftLabel;
    __weak IBOutlet UILabel *rightLabel;
    BOOL isLeft;
}
@end

@implementation InfomationViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[CustomTabBarTool shareManager] hideTabbarView:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [leftBtn setTitle:@"我要买" forState:UIControlStateNormal];
    [rightBtn setTitle:@"我要卖" forState:UIControlStateNormal];
    switch (self.type) {
        case 104:
        {
            self.title = @"求职招聘";
            [leftBtn setTitle:@"我要招聘" forState:UIControlStateNormal];
            [rightBtn setTitle:@"我要求职" forState:UIControlStateNormal];
        }
            break;
        case 105:
        {
            self.title = @"房产中介";
        }
            break;
        case 106:
        {
            self.title = @"二手市场";
        }
            break;
        case 107:
        {
            self.title = @"二手车市";
        }
            break;
            
        default:
            break;
    }
    isLeft = YES;
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)buttonAction:(UIButton *)sender {
    switch (sender.tag) {
        case 100:
        {
            leftLabel.backgroundColor = KRGBA(254, 85, 41, 1);
            rightLabel.backgroundColor = [UIColor clearColor];
            isLeft = YES;
        }
            break;
        case 101:
        {
            leftLabel.backgroundColor = [UIColor clearColor];
            rightLabel.backgroundColor = KRGBA(254, 85, 41, 1);
            isLeft = NO;
        }
            break;
        default:
            break;
    }
    NSLog(@"%@",sender.titleLabel.text);
#warning mark - 网络请求
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * Cell = @"Cell";
    InfomationTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:Cell];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"InfomationTableViewCell" owner:self options:nil]lastObject];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld",indexPath.row);
}

- (IBAction)immediatelyRelease:(UIButton *)sender {
    if (isLeft) {
        NSLog(@"发布招聘");
    } else {
        NSLog(@"发布求职");
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
