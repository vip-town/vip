//
//  showView.m
//  vip_town
//
//  Created by ly on 15/6/23.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#define kTotalForBtn 4
#define kTotalForBtnW 56
#define kTotalForBtnH 35
#define kBtnCount 10
#define kBtnY 14.166667

#import "showView.h"

@implementation showView

- (instancetype)initWithFrame:(CGRect)frame WithDataArray:(NSMutableArray *)dataArray
{
    if (self = [super initWithFrame:frame])
    {
        // 创建九宫格
        [self setupViewForBackView:dataArray];
    }
    return self;
}

/** UI布局 */
- (void)setupViewForBackView:(NSMutableArray *)dataArraies
{
    // 每行显示多少个
    int totalloc = kTotalForBtn;
    
    // 按钮宽度
    CGFloat appvieww = self.width / totalloc;
    // 按钮高度
    CGFloat appviewh = self.height / 2;
    
//    CGFloat margin = (self.frame.size.width - totalloc *appvieww)/(totalloc+1);
    
    long int count = 0;
    
    if (dataArraies.count > 0)
    {
        count = dataArraies.count;
    }
    else
    {
        count = 8;
    }
    
    for (int index = 0 ; index < count ; index++ )
    {
        int row = index / totalloc;//行号
        int loc = index % totalloc;//列号
        
        CGFloat appviewx = (appvieww) *loc;
        CGFloat appviewy = (appviewh) *row;
        
        UIButton *appview = [[UIButton alloc]initWithFrame:CGRectMake(appviewx, appviewy, appvieww, appviewh)];
        appview.tag = index;
        appview.backgroundColor = [UIColor whiteColor];
        appview.layer.borderColor = KRGBA(217, 217, 217, 1).CGColor;
        appview.layer.borderWidth = 1.0f;
        appview.titleLabel.font = [UIFont systemFontOfSize:12];
        appview.titleLabel.textAlignment = NSTextAlignmentCenter;
        [appview setBackgroundImage:[UIImage imageNamed:@"bg_words"] forState:0];
        [appview setTitleColor:[UIColor blackColor] forState:0];
       
        if (dataArraies.count > 0)
        {
            [appview setTitle:[NSString stringWithFormat:@"%@",dataArraies[index]] forState:0];
        }
        else
        {
            [appview setTitle:@"屌丝屌丝" forState:0];
        }
        [self addSubview:appview];
        [appview addTarget:self action:@selector(historyRecordClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
}

- (void)historyRecordClick:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(getMCBackgroudViewListMessage:)])
    {
        [self.delegate getMCBackgroudViewListMessage:self];
    }
}

@end
