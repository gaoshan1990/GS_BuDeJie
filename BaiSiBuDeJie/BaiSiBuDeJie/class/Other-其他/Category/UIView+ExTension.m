//
//  UIView+ExTension.m
//  BaiSiBuDeJie
//
//  Created by most on 16/12/5.
//  Copyright © 2016年 most. All rights reserved.
//

#import "UIView+ExTension.h"

@implementation UIView (ExTension)

-(CGSize)GS_size
{
    return self.frame.size;
}
-(void)setGS_size:(CGSize)GS_size
{
    CGRect frame = self.frame;
        frame.size = GS_size;
        self.frame = frame;
}
-(CGFloat)GS_x
{
    return self.frame.origin.x;
}
-(void)setGS_x:(CGFloat)GS_x
{
    CGRect frame =self.frame;
    frame.origin.x =GS_x;
    
    self.frame =frame;
    
}
-(CGFloat)GS_y
{
    return self.frame.origin.y;
}

-(void)setGS_y:(CGFloat)GS_y
{
    CGRect frame =self.frame;
    frame.origin.y =GS_y;
    self.frame =frame;
}

-(CGFloat)GS_width
{
    return self.frame.size.width;
}
-(void)setGS_width:(CGFloat)GS_width
{
    CGRect frame =self.frame;
    frame.size.width =GS_width;
    self.frame = frame;
    
}
-(CGFloat)GS_height{
    return self.frame.size.height;
}
-(void)setGS_height:(CGFloat)GS_height
{
    //1.取出来frame
    CGRect frame = self.frame;
    // 2.修改frame 中的值
    frame.size.height =GS_height;
    //3.赋值回去
    self.frame =frame;
}

-(CGFloat)GS_centerX
{
    return self.center.x;
}
-(void)setGS_centerX:(CGFloat)GS_centerX
{
    CGPoint point = self.center;
    point.x =GS_centerX;
    self.center =point;
    
    
}

-(CGFloat)GS_centerY
{
    return self.center.y;
}
-(void)setGS_centerY:(CGFloat)GS_centerY
{
    CGPoint point = self.center;
    point.x =GS_centerY;
    self.center =point;
    
}

-(CGPoint)GS_center
{
    return self.center;
}
-(void)setGS_center:(CGPoint)GS_center
{
    self.center =GS_center;
}
+ (instancetype)viewFromXib
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}

- (BOOL)intersectWithView:(UIView *)view
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CGRect selfRect = [self convertRect:self.bounds toView:window];
    CGRect viewRect = [view convertRect:view.bounds toView:window];
    return CGRectIntersectsRect(selfRect, viewRect);
}
@end
