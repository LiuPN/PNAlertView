//
//  UIView+Extension.m
//  PNCalendar
//
//  Created by lpn on 16/8/17.
//  Copyright © 2016年 lpn. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (void)setWidth:(CGFloat)width
{
   CGRect rect =  self.frame;
    rect.size.width = width;
    self.frame = rect;
}
- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect rect =  self.frame;
    rect.size.height = height;
    self.frame = rect;
}
- (CGFloat)height
{
    return self.frame.size.height;
}
- (void)setX:(CGFloat)x
{
    CGRect rect =  self.frame;
    rect.origin.x = x;
    self.frame = rect;
}
- (CGFloat)x
{
    return self.frame.origin.x;
}
- (void)setY:(CGFloat)y
{
    CGRect rect =  self.frame;
    rect.origin.y = y;
    self.frame = rect;
}
- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint point =  self.center;
    point.x = centerX;
    self.center = point;
}
- (CGFloat)centerX
{
    return self.center.x;
}
- (void)setCenterY:(CGFloat)centerY
{
    CGPoint point =  self.center;
    point.y = centerY;
    self.center = point;
}
- (CGFloat)centerY
{
    return self.center.y;
}

- (CGFloat)maxX
{
    return CGRectGetMaxX(self.frame);
}
- (CGFloat)maxY
{
    return CGRectGetMaxY(self.frame);
}

@end
