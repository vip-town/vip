//
//  CurseLabel.m
//  vip_town
//
//  Created by yanbo on 15/5/26.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#import "CurseLabel.h"
#import "Tool.h"
static CurseLabelType labelType;
static CGSize labelSize;
@implementation CurseLabel
-(instancetype)init
{
    if (self = [super init])
    {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(CurseLabel *)initWithType:(CurseLabelType)type
{
    CurseLabel * label = [[CurseLabel alloc] init];
    labelType = type;
    return label;
}


-(void)setText:(NSString *)text
{
    [super setText:text];
    switch (labelType) {
        case CurseLabelTypeAutoFrame:
        {
            labelSize = [Tool getLabelActualSize:text andFont:self.font.pointSize andLines:0 andlabelWidth:self.frame.size.width];
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, labelSize.height);
        }
            break;
        case CurseLabelTypeAutoFrameAndLine:
        {
            labelSize = [Tool getLabelActualSize:text andFont:self.font.pointSize andLines:_lineNumbers andlabelWidth:self.frame.size.width];
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, labelSize.height);
        }
            break;
        case CurseLabelTypeTapAutoFrameAndLine:
        {
            labelSize = [Tool getLabelActualSize:text andFont:self.font.pointSize andLines:0 andlabelWidth:self.frame.size.width];
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, labelSize.height);
        }
            break;
            
        default:
            break;
    }
    
}


-(void)addTarget:(UIViewController *)vc andSelector:(SEL)selector
{
    if (labelType == CurseLabelTypeTap || labelType == CurseLabelTypeTapAutoFrameAndLine)
    {
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:vc action:selector];
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:tap];
    }
}


-(void)addTarget:(UIViewController *)vc andSelector:(SEL)selector andTapNumber:(NSInteger)tapNumber
{
    if (labelType == CurseLabelTypeTap || labelType == CurseLabelTypeTapAutoFrameAndLine)
    {
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:vc action:selector];
        self.userInteractionEnabled = YES;
        tap.numberOfTapsRequired = tapNumber;
        [self addGestureRecognizer:tap];
    }
}

@end
