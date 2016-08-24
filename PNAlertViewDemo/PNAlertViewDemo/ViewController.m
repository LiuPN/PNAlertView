//
//  ViewController.m
//  PNAlertViewDemo
//
//  Created by lpn on 16/8/24.
//  Copyright © 2016年 lpn. All rights reserved.
//

#import "ViewController.h"
#import "PNAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    // @"<html><body  style=\"word-wrap:break-word; font-family:Arial; text-align:center;\">void Send Delegate</body></html>"
    
    /// 在内容添加上 可以适当添加html等属性
    PNAlertView *alertView = [[PNAlertView alloc] initWithTitle:@"qwe" content:@"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这是显示在对话框内的一段文字，欢迎您！https://github.com/LiuPN" cancelBtnTitle:@"取消" cancelBlock:^{
        
        NSLog(@"白色按钮点击了");
    } okBtnTitle:@"确定" okBlock:^{
        
        NSLog(@"红色按钮点击了");
        
    }];
    
    
    [alertView show];
}

@end
