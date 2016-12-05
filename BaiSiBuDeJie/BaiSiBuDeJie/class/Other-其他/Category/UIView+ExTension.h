//
//  UIView+ExTension.h
//  BaiSiBuDeJie
//
//  Created by most on 16/12/5.
//  Copyright © 2016年 most. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ExTension)
@property (nonatomic, assign) CGSize  GS_size;
@property (nonatomic, assign) CGFloat GS_width;
@property (nonatomic, assign) CGFloat GS_height;
@property (nonatomic, assign) CGFloat GS_x;
@property (nonatomic, assign) CGFloat GS_y;
@property (nonatomic, assign) CGFloat GS_centerX;
@property (nonatomic, assign) CGFloat GS_centerY;
@property (nonatomic, assign) CGPoint GS_center;



+ (instancetype)viewFromXib;

- (BOOL)intersectWithView:(UIView *)view;
@end
