//
//  PNAlertView.h
//  PNAlertView
//
//  Created by lpn on 16/8/19.
//  Copyright © 2016年 lpn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Extension.h"

typedef void(^btnBlock)();

@interface PNAlertView : UIView

/// 取消按钮block
@property(nonatomic, copy) btnBlock cancelBlock;
/// 确定按钮block
@property(nonatomic, copy) btnBlock okBlock;

/// 对象方法
- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content cancelBtnTitle:(NSString *)clBtnTitle cancelBlock:(btnBlock)clBlock okBtnTitle:(NSString *)okBtnTitle okBlock:(btnBlock)okBlock;

/// 展示
- (void)show;
@end
