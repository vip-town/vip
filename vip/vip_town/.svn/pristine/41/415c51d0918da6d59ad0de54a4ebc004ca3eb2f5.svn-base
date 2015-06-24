//
//  CurseLabel.h
//  vip_town
//
//  Created by yanbo on 15/5/26.
//  Copyright (c) 2015年 vip. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    CurseLabelTypeTap = 0,                                             //带点击事件
    CurseLabelTypeAutoFrame,                                           //根据文字自适应宽高
    CurseLabelTypeAutoFrameAndLine,                                    //根据文字自适应宽高并且限制行数
    CurseLabelTypeTapAutoFrameAndLine                                  //带点击事件.根据文字自适应宽高并且限制行数
}CurseLabelType;

@interface CurseLabel : UILabel
@property (nonatomic, assign) NSInteger lineNumbers;                //限制的文本行数




/**
 *  初始化Label
 *
 *  @param type 参照-CurseLabelType
 *
 *  @return
 */
-(CurseLabel *)initWithType:(CurseLabelType)type;


/**
 *  对点击Label的事件处理
 *
 *  @param vc       Target
 *  @param selector
 */
-(void)addTarget:(CurseLabel *)label andSelector:(SEL)selector;

/**
 *  对点击Label的事件处理
 *
 *  @param vc        Target
 *  @param selector
 *  @param tapNumber 触发事件的点击次数
 */
-(void)addTarget:(CurseLabel *)label andSelector:(SEL)selector andTapNumber:(NSInteger)tapNumber;


@end
