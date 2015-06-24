//
//  AFNHelp.h
//  封装AFHTTPRequestOperationManager
//
//  Created by snow on 15/1/28.
//  Copyright (c) 2015年 snow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
@interface AFNHelp : NSObject
/**
 *  数据下载GET
 *
 *  @param string     URLString
 *  @param parameters 参数字典
 *  @param block      回调block
 *
 *  @return 成功失败
 */
+ (NSOperation *)loadDataWithGET:(NSString *)string and:(NSDictionary *)parameters AndBlocks:(void (^)(id result))block;

/**
 *  数据下载上传POST
 *
 *  @param string     URLString
 *  @param parameters 请求体字典
 *  @param block      回调block
 *
 *  @return 成功失败
 */
+ (NSOperation *)loadDataWithPOST:(NSString *)string and:(NSDictionary *)parameters AndBlocks:(void (^)(id result))block;

/**
 *  上传图片
 *
 *  @param urlStr     图片网址
 *  @param parameters 其他参数
 *  @param block      回调block
 *
 *  @return 成功失败
 */
+ (NSOperation *)uploadImagePOST:(NSString *)urlStr andImage:(UIImage *)image and:(NSDictionary *)parameters AndBlocks:(void (^)(id result))block;



/**
 *  获得当前时间
 *
 *  @return 当前时间
 */
+ (NSString *)getCurrentTime;
/**
 *  改变导航栏颜色和字体大小
 *
 *  @param fountSize 字体大小
 *  @param color     字体颜色
 */
+ (void)changeNaviTitleAndFountSize:(CGFloat)fountSize andColor:(UIColor *)color;
/**
 *  改变信号栏颜色
 *
 *  @param color 想要改变的颜色
 */
+ (void)changeSignalFormatWithColor:(UIColor *)color;

+ (void)copyFilesWithString:(NSString*)string;

@end
