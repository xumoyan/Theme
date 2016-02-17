//
//  BNYTheme.m
//
//
//  Created by 张冠清 on 15/12/24.
//  Copyright (c) 2015年 Buyforyou. All rights reserved.
//

#import "BNYTheme.h"
#import <UIKit/UIKit.h>
#define MYBUNDLE_NAME1 @ "Resource2.bundle"
#define MYBUNDLE_PATH1 [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: MYBUNDLE_NAME1]
#define MYBUNDLE1 [NSBundle bundleWithPath: MYBUNDLE_PATH1]

#define MYBUNDLE_NAME2 @ "Resource1.bundle"
#define MYBUNDLE_PATH2 [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: MYBUNDLE_NAME2]
#define MYBUNDLE3 [NSBundle bundleWithPath: MYBUNDLE_PATH3]

@implementation BNYTheme
#pragma mark - 返回单例
+ (instancetype)ShareColorManager {
    static BNYTheme *manger = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        manger = [[BNYTheme alloc] init];
    });
    return manger;
}
#pragma mark - 改变主题
+ (void)changeThemeModel:(ThemeType)colorType {
    BNYTheme *manager = [BNYTheme ShareColorManager];
    ThemeModel *model = manager.themeModel;
    manager.themeType = colorType;
    switch (manager.themeType) {
        case themeOne: {
            NSString *plistColor = [[NSBundle mainBundle] pathForResource:@"one" ofType:@"plist"];
            
            NSDictionary *colorManager = [NSDictionary dictionaryWithContentsOfFile:plistColor];
            
            NSDictionary *colorDefault = colorManager[@"default"];
            
            model.rootBackColor = [self colorWithHexString:colorDefault[@"backViewColor"]];
            
            model.btnImage = [UIImage imageNamed:@"Resource1.bundle/001"];

        } break;
        case themeTwo: {

            NSString *plistColor = [[NSBundle mainBundle] pathForResource:@"two" ofType:@"plist"];
            
            NSDictionary *colorManager = [NSDictionary dictionaryWithContentsOfFile:plistColor];
            
            NSDictionary *colorDefault = colorManager[@"default"];
            
            model.rootBackColor = [self colorWithHexString:colorDefault[@"backViewColor"]];
            
            model.btnImage = [UIImage imageNamed:@"Resource2.bundle/003"];

        } break;
        default:
            break;
    }
    [self sendMeasgeAboutTheme];
}
#pragma mark - 发送通知
+ (void)sendMeasgeAboutTheme {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TopicMessage" object:nil];
}
#pragma mark - 初始化
- (instancetype)init {
    self = [super init];
    if (self) {
        self.themeType = themeOne;
        self.themeModel = [[ThemeModel alloc] init];
        //获取主题的plist文件
        NSString *plistColor = [[NSBundle mainBundle] pathForResource:@"one" ofType:@"plist"];
        NSDictionary *colorManager = [NSDictionary dictionaryWithContentsOfFile:plistColor];
        NSDictionary *colorDefault = colorManager[@"default"];
        //对model的color进行赋值
        self.themeModel.rootBackColor = [BNYTheme colorWithHexString:colorDefault[@"backViewColor"]];
        
        self.themeModel.btnImage = [UIImage imageNamed:@"Resource1.bundle/001"];
        
    }
    return self;
}
#pragma mark - 颜色转换 IOS中十六进制的颜色转换为UIColor
+ (UIColor *)colorWithHexString:(NSString *)color {
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // 字符串应该是6或8个字符
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // 如果出现带0 x
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // 分离成r,g,b子字符串
    NSRange range;
    range.location = 0;
    range.length = 2;
    // r
    NSString *rString = [cString substringWithRange:range];
    // g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    // b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // 扫描值
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];

    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:1.0f];
}
@end

@implementation ThemeModel

@end