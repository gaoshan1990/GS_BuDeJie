//
//  GSTabBar.m
//  BaiSiBuDeJie
//
//  Created by most on 16/12/5.
//  Copyright © 2016年 most. All rights reserved.
//

#import "GSTabBar.h"
#import "UIView+ExTension.h"
@interface GSTabBar()
@property (nonatomic, weak) UIButton *publishButton;

@end
@implementation GSTabBar
- (UIButton *)publishButton
{
    if (!_publishButton) {
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:publishButton];
        _publishButton = publishButton;
    }
    return _publishButton;
}

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
    }
    return self;
}

/**
 *  布局子控件
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    /**** 按钮的尺寸 ****/
    CGFloat buttonW = self.GS_width / 5;
    CGFloat buttonH = self.GS_height;
    
    /**** 设置所有UITabBarButton的frame ****/
    CGFloat tabBarButtonY = 0;
    // 按钮索引
    int tabBarButtonIndex = 0;
    
    for (UIView *subview in self.subviews) {
        // 过滤掉非UITabBarButton
        if (subview.class != NSClassFromString(@"UITabBarButton")) continue;
        
        // 设置frame
        CGFloat tabBarButtonX = tabBarButtonIndex * buttonW;
        if (tabBarButtonIndex >= 2) { // 右边的2个UITabBarButton
            tabBarButtonX += buttonW;
        }
        subview.frame = CGRectMake(tabBarButtonX, tabBarButtonY, buttonW, buttonH);
        
        // 增加索引
        tabBarButtonIndex++;
        
        //        UIControl *tabBarButton = (UIControl *)subview;
        //        [tabBarButton addTarget:self action:@selector(tabBarButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    /**** 设置中间的发布按钮的frame ****/
    self.publishButton.GS_width = buttonW;
    self.publishButton.GS_height = buttonH;
    self.publishButton.GS_center = CGPointMake(self.GS_width * 0.5, self.GS_height * 0.5);
}
#pragma mark - 监听
- (void)publishClick
{
    NSLog(@"%@",NSStringFromCGRect(self.publishButton.frame));
}

@end
