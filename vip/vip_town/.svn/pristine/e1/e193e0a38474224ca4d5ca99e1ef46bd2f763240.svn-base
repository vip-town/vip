//
//  CurseImageView.h
//  vip_town
//
//  Created by yanbo on 15/5/26.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    CurseImageViewTypeRoundRect = 0,                                        //圆形
    CurseImageViewTypeTap                                                   //带点击事件
}CurseImageViewType;

@interface CurseImageView : UIImageView
-(CurseImageView *)initWithType:(CurseImageViewType)type;

-(void)addTarget:(UIViewController *)vc andSelector:(SEL)selector;

@end
