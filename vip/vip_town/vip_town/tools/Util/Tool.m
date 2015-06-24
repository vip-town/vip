//
//  Tool.m
//  vip_town
//
//  Created by yanbo on 15/5/26.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#import "Tool.h"

@implementation Tool


+(CGSize)getLabelActualSize:(NSString *)str andFont:(CGFloat)fontSize andLines:(NSInteger)lines andlabelWidth:(CGFloat)labelWidth
{
    CGSize size = [str sizeWithAttributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:fontSize] forKey:NSFontAttributeName]];
    NSInteger labelLines = size.width / labelWidth;
    BOOL isEqual = NO;
    for (int i = 0; i < labelLines; i++)
    {
        if (labelWidth * i == size.width)
        {
            isEqual = YES;
        }
    }
    if (!isEqual)
    {
        labelLines++;
    }
    if (lines == 0)
    {
        if (size.width < labelWidth)
        {
            labelWidth = size.width;
        }
        return CGSizeMake(labelWidth, labelLines * size.height);
    }
    else
    {
        if (labelLines >= lines)
        {
            return CGSizeMake(labelWidth, lines * size.height);
        }
        else
        {
            return CGSizeMake(labelWidth, labelLines * size.height);
        }
    }
}

+(UIImage *)changeColorToImage:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
