//
//  PNAlertView.m
//  PNAlertView
//
//  Created by lpn on 16/8/19.
//  Copyright © 2016年 lpn. All rights reserved.
//

#import "PNAlertView.h"

#define PNLeftMargin 20
#define PNRightMargin leftMargin
#define PNScreenWidth [UIScreen mainScreen].bounds.size.width
#define PNScreenHeight [UIScreen mainScreen].bounds.size.height

@interface PNAlertView ()<UIWebViewDelegate>
/// 遮罩层
@property(nonatomic, weak) UIView *coverV;
/// titleLbl
@property(nonatomic, weak) UILabel *titleLbl;
/// 上分割线
@property(nonatomic, weak) UILabel *lineTop;
/// webView
@property(nonatomic, weak) UIWebView *webView;
/// 下分割线
@property(nonatomic, weak) UILabel *lineBottom;
/// 取消按钮
@property(nonatomic, weak) UIButton *cancelBtn;
/// 确定按钮
@property(nonatomic, weak) UIButton *okBtn;
@end

@implementation PNAlertView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 10.0;
        self.layer.masksToBounds = YES;
        
        /// titleView
        UILabel *titleLbl = [[UILabel alloc] init];
        titleLbl.backgroundColor  =[UIColor whiteColor];
        titleLbl.textAlignment = NSTextAlignmentCenter;
        [self addSubview:titleLbl];
        self.titleLbl = titleLbl;
        
        /// lineTop
        UILabel *lineTop = [[UILabel alloc] init];
        lineTop.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:lineTop];
        self.lineTop = lineTop;
        
        // 添加webview
        UIWebView *webView = [[UIWebView alloc] init];
        webView.opaque = NO; //不设置这个值 页面背景始终是白色
        webView.backgroundColor = [UIColor whiteColor]; // clearColor显示scrollView的颜色
        webView.delegate = self;
        [self addSubview:webView];
        self.webView = webView;
        
        /// lineBottom
        UILabel *lineBottom = [[UILabel alloc] init];
        lineBottom.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:lineBottom];
        self.lineBottom = lineBottom;
        
        // 取消按钮
        UIButton *cancelBtn = [[UIButton alloc] init];
        [cancelBtn setBackgroundColor:[UIColor whiteColor]];
        [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:cancelBtn];
        self.cancelBtn = cancelBtn;
        [self.cancelBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        // 确定按钮
        UIButton *okBtn = [[UIButton alloc] init];
        [okBtn setBackgroundColor:[UIColor colorWithRed:235/255.0 green:65/255.0 blue:61/255.0 alpha:1.0]];
        [self addSubview:okBtn];
        self.okBtn = okBtn;
        [self.okBtn addTarget:self action:@selector(okBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content cancelBtnTitle:(NSString *)clBtnTitle cancelBlock:(btnBlock)clBlock okBtnTitle:(NSString *)okBtnTitle okBlock:(btnBlock)okBlock
{
    if (self = [super init]) {
        // 标题
        self.titleLbl.text = title;
        // 内容
        [self.webView loadHTMLString:content baseURL:nil];
        // 按钮标题
        if (clBtnTitle) {
            [self.cancelBtn setTitle:clBtnTitle forState:UIControlStateNormal];
        }
        
        if (okBtnTitle) {
            [self.okBtn setTitle:okBtnTitle forState:UIControlStateNormal];
        }
        
        
        // 赋值block
        if (clBlock) {
            self.cancelBlock = clBlock;
        }
        if (okBlock) {
            self.okBlock = okBlock;
        }
        
        
    }
    return self;
}
- (void)show
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    UIView *coverV = [[UIView alloc] init];
    coverV.backgroundColor = [UIColor lightGrayColor];
    coverV.frame = keyWindow.bounds;
    [keyWindow addSubview:coverV];
    self.coverV  = coverV;
    
    coverV.hidden = YES;
    self.hidden = YES;
  [self.coverV addSubview:self];

    // 为了等到0.4s后webView高度显示完全
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        self.coverV.hidden = NO;
        self.hidden = NO;
        
        self.coverV.alpha = 0.3;
        self.alpha = 0.3;
        [UIView animateWithDuration:0.2 animations:^{
            
            self.coverV.alpha = 1.0;
            self.alpha = 1.0;
        }];
        
    });
    

    // 显示的动画效果
    
}
- (void)cancelBtnClick:(UIButton *)cancelBtn
{
    // 视图消失
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0.3;
        self.coverV.alpha = 0.3;
    } completion:^(BOOL finished) {
        [self.coverV removeFromSuperview];
    }];
    
    // 取消事件
    if (self.cancelBlock) {
        self.cancelBlock();
    }
}
- (void)okBtnClick:(UIButton *)okBtn
{
    // 视图消失
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0.3;
        self.coverV.alpha = 0.3;
    } completion:^(BOOL finished) {
        [self.coverV removeFromSuperview];
    }];
        

    // 确定事件
    if (self.okBlock) {
        self.okBlock();
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    
    self.width = PNScreenWidth - 2 * PNLeftMargin;
    // title
    self.titleLbl.frame = CGRectMake(0, 0, self.width, 40);
    // line
    self.lineTop.frame = CGRectMake(0, CGRectGetMaxY(self.titleLbl.frame), self.width, 0.5);
    // webview frame
    self.webView.x = 5;
    self.webView.y = CGRectGetMaxY(self.titleLbl.frame)+5;
    self.webView.width = self.width - 5 * 2;
    
     self.lineBottom.frame = CGRectMake(0, CGRectGetMaxY(self.webView.frame)+5, self.width * 0.5, 0.5);
    
    // cancelBtn
    self.cancelBtn.frame = CGRectMake(0, CGRectGetMaxY(self.lineBottom.frame), self.width * 0.5, 44);
    if (!self.cancelBtn.titleLabel.text) { // 取消按钮不存在
        self.cancelBtn.width = 0.0;
    }
    
    // okBtn
    self.okBtn.frame = CGRectMake(self.cancelBtn.maxX, self.cancelBtn.y - 0.5, self.width - self.cancelBtn.width, self.cancelBtn.height);
    if (!self.okBtn.titleLabel.text) { // 确定按钮不存在
        self.okBtn.width = 0;
        self.cancelBtn.width = self.width;
        self.lineBottom.width = self.cancelBtn.width;
    }
    
    
    self.height = CGRectGetMaxY(self.okBtn.frame);
    self.centerX = PNScreenWidth * 0.5;
    self.centerY = PNScreenHeight * 0.5;
   
    
    
}

/// 调整高度
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
   CGFloat height = [[self.webView stringByEvaluatingJavaScriptFromString:@"document.body.scrollHeight"] floatValue];
    
    self.webView.height = height;
    
  
}

@end
