//
//  CurseImageView.m
//  vip_town
//
//  Created by yanbo on 15/5/26.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#import "CurseImageView.h"
static CurseImageViewType imageVieType;
@implementation CurseImageView



-(CurseImageView *)initWithType:(CurseImageViewType)type
{
    CurseImageView * imageVie = [[CurseImageView alloc] init];
    imageVieType = type;
    return imageVie;
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    switch (imageVieType) {
        case CurseImageViewTypeRoundRect:
        {
            self.layer.cornerRadius = self.frame.size.width/2;
            self.layer.masksToBounds = YES;
        }
            break;
            
        default:
            break;
    }
}

-(void)addTarget:(UIViewController *)vc andSelector:(SEL)selector
{
    if (imageVieType == CurseImageViewTypeTap)
    {
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:vc action:selector];
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:tap];
    }
}

@end
