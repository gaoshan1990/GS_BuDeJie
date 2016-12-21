//
//  GSRefreshAutoFooter.m
//  BaiSiBuDeJie
//
//  Created by most on 16/12/21.
//  Copyright © 2016年 most. All rights reserved.
//

#import "GSRefreshAutoFooter.h"

@implementation GSRefreshAutoFooter

- (void)prepare
{
    [super prepare];
    
    self.stateLabel.textColor = [UIColor greenColor];
    
    [self setTitle:@"没有数据啦,不要再上拉了" forState:MJRefreshStateNoMoreData];
    
    // 刷新控件出现一半就会进入刷新状态
    //    self.triggerAutomaticallyRefreshPercent = 0.5;
    
    // 不要自动刷新
    //    self.automaticallyRefresh = NO;
}
@end
