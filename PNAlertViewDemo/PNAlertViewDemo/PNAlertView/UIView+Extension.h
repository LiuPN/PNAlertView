//
//  UIView+Extension.h
//  PNCalendar
//
//  Created by lpn on 16/8/17.
//  Copyright © 2016年 lpn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property(nonatomic, assign) CGFloat width;
@property(nonatomic, assign) CGFloat height;
@property(nonatomic, assign) CGFloat x;
@property(nonatomic, assign) CGFloat y;
@property(nonatomic, assign) CGFloat centerX;
@property(nonatomic, assign) CGFloat centerY;
@property(nonatomic, assign, readonly) CGFloat maxX; // 没有set方法
@property(nonatomic, assign, readonly) CGFloat maxY; // 没有set方法
@end
