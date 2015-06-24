//
//  extraEducationTableViewCell.m
//  vip_town
//
//  Created by MeiCai_liyi on 15/6/23.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#import "extraEducationTableViewCell.h"

@implementation extraEducationTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/** 自定义cell分割线 */
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    
    //上分割线，
    CGContextSetStrokeColorWithColor(context, KRGBA(232, 232, 232, 1).CGColor);
    CGContextStrokeRect(context, CGRectMake(0, -1, rect.size.width , 0.5));
    
    //下分割线
    CGContextSetStrokeColorWithColor(context, KRGBA(232, 232, 232, 1).CGColor);
    CGContextStrokeRect(context, CGRectMake(0, rect.size.height, rect.size.width , 0.5));
}
@end
