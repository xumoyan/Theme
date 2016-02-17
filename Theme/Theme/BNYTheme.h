//
//  BNYTheme.h
//
//
//  Created by 张冠清 on 15/12/24.
//  Copyright (c) 2015年 Buyforyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef enum { themeOne, themeTwo } ThemeType;
@class ThemeModel;
@interface BNYTheme : NSObject

+ (instancetype)ShareColorManager;
@property (nonatomic, assign) ThemeType themeType;
@property (nonatomic, strong) ThemeModel *themeModel;
+ (void)changeThemeModel:(ThemeType)colorType;
+ (void)sendMeasgeAboutTheme;
+ (UIColor *)colorWithHexString:(NSString *)color;
@end

@interface ThemeModel : NSObject

@property (assign, nonatomic) float tabTitleFont;
/*!
 *  view的背景颜色
 */
@property (strong, nonatomic) UIColor *rootBackColor;
/*!
 *  图片
 */
@property (strong, nonatomic) UIImage *btnImage;
@end