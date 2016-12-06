//
//  UIBarButtonItem+ExTension.h
//  BaiSiBuDeJie
//
//  Created by most on 16/12/6.
//  Copyright © 2016年 most. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (ExTension)
+(instancetype)initWithImage:(NSString *)image highImage:(NSString *)highImage
                      target:(id)target action:(SEL)action;
@end
