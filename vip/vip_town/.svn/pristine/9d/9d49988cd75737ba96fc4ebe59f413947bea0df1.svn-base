//
//  AFNHelp.m
//  D1CMLogin
//
//  Created by snow on 15/1/28.
//  Copyright (c) 2015年 snow. All rights reserved.
//

#import "AFNHelp.h"
#import "AFAppDotNetAPIClient.h"
@implementation AFNHelp
/**
 *  数据下载GET
 *
 *  @param string     URLString
 *  @param parameters 参数字典
 *  @param block      回调block
 *
 *  @return 成功失败
 */
+ (NSURLSessionDataTask *)loadDataWithGET:(NSString *)string and:(NSDictionary *)parameters AndBlocks:(void (^)(id result))block{
    
    return [[AFAppDotNetAPIClient sharedClient] GET:string parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSDictionary *dic = (NSDictionary *)responseObject;
        
        block(dic);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
       
        block(error);
       
        NSLog(@"%@",error.userInfo);
    }];
}

/**
 *  数据下载上传POST
 *
 *  @param string     URLString
 *  @param parameters 请求体字典
 *  @param block      回调block
 *
 *  @return 成功失败
 */
+ (NSURLSessionDataTask *)loadDataWithPOST:(NSString *)string and:(NSDictionary *)parameters AndBlocks:(void (^)(id result))block{
    return [[AFAppDotNetAPIClient sharedClient] POST:string parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *dic = (NSDictionary *)responseObject;
        block(dic);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        block(error);
        NSLog(@"%@",error.userInfo);
    }];
}
/**
 *  上传图片
 *
 *  @param urlStr     图片网址
 *  @param parameters 其他参数
 *  @param block      回调block
 *
 *  @return 成功失败
 */
+ (NSURLSessionDataTask *)uploadImagePOST:(NSString *)urlStr andImage:(UIImage *)image and:(NSDictionary *)parameters AndBlocks:(void (^)(id result))block{
    return [[AFAppDotNetAPIClient sharedClient] POST:urlStr parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
        
        [formData appendPartWithFileData:imageData name:@"personImage" fileName:@"photos.png" mimeType:@"image/png"];
        
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *dic = (NSDictionary *)responseObject;
        block(dic);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        block(error);
        NSLog(@"%@",error);
    }];
}

/**
 *  获得当前时间
 *
 *  @return 当前时间
 */
+ (NSString *)getCurrentTime{
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setDateFormat:@"yyyy-MM-dd"];
    NSString *date = [f stringFromDate:[NSDate date]];
    return date;
}
/**
 *  改变导航栏颜色和字体大小
 *
 *  @param fountSize 字体大小
 *  @param color     字体颜色
 */
+ (void)changeNaviTitleAndFountSize:(CGFloat)fountSize andColor:(UIColor *)color{
    UINavigationBar *navBar = [UINavigationBar appearance];
    // 设置背景
    //    [navBar setBackgroundImage:[UIImage resizedImageWithName:@""] forBarMetrics:UIBarMetricsDefault];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    // 设置标题属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = color;
    textAttrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    
    textAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:fountSize];
    [navBar setTitleTextAttributes:textAttrs];
}

/**
 *  改变信号栏字体颜色
 *
 *  @param color 颜色参数
 */
+ (void)changeSignalFormatWithColor:(UIColor *)color{
    UIApplication * app = [UIApplication sharedApplication];
    id obj = [app valueForKeyPath:@"statusBar"];
    unsigned int propertyCount;
    objc_property_t * properties = class_copyPropertyList([obj class], &propertyCount);
    NSMutableArray * arr = [NSMutableArray arrayWithCapacity:1];
    for (int i = 0; i < propertyCount; i++)
    {
        objc_property_t property = properties[i];
        NSString * propertyStr = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        if ([propertyStr isEqualToString:@"foregroundColor"])
        {
            [obj setValue:color forKey:propertyStr];
        }
        [arr addObject:propertyStr];
    }
    
}


+ (void)copyFilesWithString:(NSString*)string{
//    从沙盒中取出HTML的文件地址
    NSString *fromPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:string];
//    存到沙盒当中的documents下的Sring路径下
    NSString *toPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:string];
    if (![[NSFileManager defaultManager] fileExistsAtPath:toPath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:toPath withIntermediateDirectories:YES attributes:nil error:nil];
//        DEBUG_LOG(@"from path %@ to %@",fromPath,toPath);
        
        NSArray *resContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:fromPath error:nil];
        
        for (NSString *obj in resContents) {
            NSError *err;
            NSLog(@"obj is %@",obj);
            if (![[NSFileManager defaultManager] copyItemAtPath:[fromPath stringByAppendingPathComponent:obj] toPath:[toPath stringByAppendingPathComponent:obj] error:&err]) {
                
            }
            
            
        }
        
        
    }
    
    
}

@end
