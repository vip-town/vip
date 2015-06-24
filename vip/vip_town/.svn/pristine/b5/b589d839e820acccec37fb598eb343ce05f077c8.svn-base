//
//  showView.h
//  vip_town
//
//  Created by ly on 15/6/23.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#import <UIKit/UIKit.h>
@class showView;

@protocol showViewDelegate <NSObject>

/** 获取相应表格信息 */
- (void)getMCBackgroudViewListMessage:(showView *)backgroudView;

@end

@interface showView : UIView
- (instancetype)initWithFrame:(CGRect)frame WithDataArray:(NSMutableArray *)dataArray;
@property (nonatomic ,weak)id <showViewDelegate> delegate;

@end
