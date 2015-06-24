//
//  ConsumerCell.h
//  vip_town
//
//  Created by 李毅 on 15/6/22.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConsumerCell : UITableViewCell

/** 头像logo */
@property (weak, nonatomic) IBOutlet UIImageView *iconLogo;

/** 名字 */
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

/** 评论标签 */
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

/** 时间 */
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

/** 评论内容 */
@property (weak, nonatomic) IBOutlet UILabel *commentContentLabel;

@end
