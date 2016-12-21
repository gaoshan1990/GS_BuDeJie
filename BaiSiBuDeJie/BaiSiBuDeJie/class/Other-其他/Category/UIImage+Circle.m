//
//  UIImage+Circle.m
//  BaiSiBuDeJie
//
//  Created by most on 16/12/21.
//  Copyright © 2016年 most. All rights reserved.
//

#import "UIImage+Circle.h"

@implementation UIImage (Circle)
-(instancetype)circleImage
{
    // 开启上下文
    UIGraphicsBeginImageContext(self.size);
    
    //获得上下文
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // 添加一个圆
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    
    // 裁剪
    CGContextClip(ctx);
    
    // 绘制图片
    [self drawInRect:rect];
    
    // 获得图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;
    
}

+ (instancetype)circleImage:(NSString *)name
{
    return [[self imageNamed:name] circleImage];
}
@end
