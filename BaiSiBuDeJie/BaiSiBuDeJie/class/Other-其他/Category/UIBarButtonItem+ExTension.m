//
//  UIBarButtonItem+ExTension.m
//  BaiSiBuDeJie
//
//  Created by most on 16/12/6.
//  Copyright © 2016年 most. All rights reserved.
//

#import "UIBarButtonItem+ExTension.h"

@implementation UIBarButtonItem (ExTension)
+(instancetype)initWithImage:(NSString *)image highImage:(NSString *)highImage
                      target:(id)target action:(SEL)action
{
    UIButton *button =[[UIButton alloc]init];
    
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    
      [button sizeToFit];

    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc] initWithCustomView:button];
    
}
@end
