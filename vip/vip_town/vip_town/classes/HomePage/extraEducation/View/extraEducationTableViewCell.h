//
//  extraEducationTableViewCell.h
//  vip_town
//
//  Created by MeiCai_liyi on 15/6/23.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface extraEducationTableViewCell : UITableViewCell

/** 标签 */
@property (weak, nonatomic) IBOutlet UILabel *markLabel;
/** 商品名称 */
@property (weak, nonatomic) IBOutlet UILabel *comparyName;
/** 好评率 */
@property (weak, nonatomic) IBOutlet UILabel *goodcCmment;
/** 成交量 */
@property (weak, nonatomic) IBOutlet UILabel *volumeNumber;
/** 价格 */
@property (weak, nonatomic) IBOutlet UILabel *price;
/** 时间 */
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
