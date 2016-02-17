//
//  ViewController.m
//  Theme
//
//  Created by 张冠清 on 16/2/16.
//  Copyright © 2016年 buyforyou. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    ThemeModel *modelColor;//颜色model
    UIButton *btn;//按钮
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    btn = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 50)/2, 100, 50, 50)];
    btn.backgroundColor = [UIColor greenColor];
    [btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)switchTheme{
    modelColor = [BNYTheme ShareColorManager].themeModel;
    [btn setImage:modelColor.btnImage forState:0];
    self.view.backgroundColor = modelColor.rootBackColor;
}
-(void)test{
    ThemeType type = [BNYTheme ShareColorManager].themeType;
    if (type == themeOne) {
        [BNYTheme changeThemeModel:themeTwo];
        [btn setImage:modelColor.btnImage forState:0];
    }else{
        [BNYTheme changeThemeModel:themeOne];
        [btn setImage:modelColor.btnImage forState:0];
    }
}
@end
